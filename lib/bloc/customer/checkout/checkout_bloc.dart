import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/repos/common/signup/userAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/address.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/deliveryDetails.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/normalOrder.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderInProgressAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderPriceInformation.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/customer/actual/product/orderProductModel.dart';
import 'dart:async';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(BuildContext context) : super(CheckoutState.initialState);
  final UserAPIProvider userApiProvider = new UserAPIProvider();
  ProgressingOrderAPIProvider orderAPIProvider =
      new ProgressingOrderAPIProvider();
  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(
          error: error,
        );
        break;

      // =========== Upload prescription images ===========
      case UploadPrescriptionEvent:
        final String image = (event as UploadPrescriptionEvent).image;
        final List<String> newLocalPhotoPaths = state.localPhotoPaths;
        final List<File> photos = state.photos;
        newLocalPhotoPaths.add(image);
        photos.add(File(image));
        yield state.clone(
          localPhotoPaths: newLocalPhotoPaths,
          photos: photos,
        );
        break;

      // =========== Remove a prescription image ===========

      case RemoveImageEvent:
        final String image = (event as RemoveImageEvent).image;
        final List<String> localPhotoPaths = state.localPhotoPaths;
        final List<File> photos = state.photos;
        photos.remove(File(image));
        localPhotoPaths.remove(image);
        yield state.clone(
          localPhotoPaths: localPhotoPaths,
          photos: photos,
        );
        break;

      // =========== Add/Remove/Update quantity of products ===========

      case UpdateProductListEvent:
        final product = (event as UpdateProductListEvent).product;
        final prescriptionNeeded = product.prescriptionNeeded;

        List<OrderProduct> productListPrescriptionless =
            state.productListPrescriptionless;
        List<OrderProduct> productListNeedPrescriptions =
            state.productListNeedPrescriptions;
        double tempTotal = state.productListTotal;
        int productID = product.id;

        List<int> productIDs = state.productIDs;
        if (productIDs.contains(productID)) {
          if (prescriptionNeeded) {
            for (OrderProduct orderProduct in productListNeedPrescriptions) {
              if (orderProduct.id == productID) {
                tempTotal -= product.actualPrice * orderProduct.amountOrdered;
                productListNeedPrescriptions.remove(orderProduct);
                break;
              }
            }
          } else {
            for (OrderProduct orderProduct in productListPrescriptionless) {
              if (orderProduct.id == productID) {
                tempTotal -= product.actualPrice * orderProduct.amountOrdered;
                productListPrescriptionless.remove(orderProduct);
                break;
              }
            }
          }
          productIDs.remove(productID);
        } else {
          OrderProduct orderProduct = OrderProduct(
            id: productID,
            productName: product.productName,
            actualPrice: product.actualPrice,
            amountOrdered: 1,
            product: product,
          );
          productIDs.add(productID);
          if (product.prescriptionNeeded) {
            productListNeedPrescriptions.add(orderProduct);
          } else {
            productListPrescriptionless.add(orderProduct);
          }
          tempTotal += product.actualPrice;
          print(tempTotal);
        }
        yield state.clone(
          productIDs: productIDs,
          productListTotal: tempTotal,
          productListNeedPrescriptions: state.productListNeedPrescriptions,
          productListPrescriptionless: productListPrescriptionless,
        );
        break;

      //  Get delivery charge for normal order

      case GetDeliveryChargeForNormalOrder:
        yield state.clone(orderLoading: true);
        List<DeliveryChargeProduct> deliveryProducts = [];
        for (OrderProduct p in state.productListPrescriptionless) {
          DeliveryChargeProduct newDeliveryProduct = new DeliveryChargeProduct(
            productID: p.id.toString(),
            quantity: p.amountOrdered,
            supplierID: p.product.supplierID,
            soldUnitPrice: p.actualPrice,
          );
          print(p.actualPrice);
          deliveryProducts.add(newDeliveryProduct);
        }
        for (OrderProduct p in state.productListNeedPrescriptions) {
          DeliveryChargeProduct newDeliveryProduct = new DeliveryChargeProduct(
            productID: p.id.toString(),
            quantity: p.amountOrdered,
            supplierID: p.product.supplierID,
            soldUnitPrice: p.actualPrice,
          );
          print(p.actualPrice);
          deliveryProducts.add(newDeliveryProduct);
        }
        DeliveryDetails delivery = new DeliveryDetails(
          customerAddressID: 2,
          city: state.city.city,
          district: state.city.district,
          streetAddress: state.streetAddress,
          products: deliveryProducts,
        );
        OrderPriceInformation orderPriceInformation =
            await orderAPIProvider.getDeliveryChargeForNormalOrder(delivery);
        print(orderPriceInformation);
        print(orderPriceInformation.deliveryCharge);
        yield state.clone(
          orderLoading: false,
          deliveryCharge: orderPriceInformation.deliveryCharge.toDouble(),
          productListTotal: orderPriceInformation.totalPrice.toDouble(),
        );
        break;
      //  Confirm normal order
      case ConfirmNormalCashOrder:
        yield state.clone(orderLoading: true);
        List<OrderConfirmationProducts> orderConfirmationProducts = [];
        for (OrderProduct p in state.productListPrescriptionless) {
          OrderConfirmationProducts newOrderConfirmationProduct =
              new OrderConfirmationProducts(
            productID: p.id.toString(),
            quantity: p.amountOrdered,
            supplierID: p.product.supplierID,
            soldUnitPrice: p.actualPrice,
            addedChargePercentage: 0,
            addedCharge: 0,
          );
          orderConfirmationProducts.add(newOrderConfirmationProduct);
        }

        for (OrderProduct p in state.productListNeedPrescriptions) {
          OrderConfirmationProducts newOrderConfirmationProduct =
              new OrderConfirmationProducts(
            productID: p.id.toString(),
            quantity: p.amountOrdered,
            supplierID: p.product.supplierID,
            soldUnitPrice: p.actualPrice,
            addedChargePercentage: 0,
            addedCharge: 0,
          );
          orderConfirmationProducts.add(newOrderConfirmationProduct);
        }
        OrderResponse response;
        print(state.productListTotal);
        print(state.deliveryCharge);
        NormalOrder order = new NormalOrder(
          totalPrice: state.productListTotal,
          deliveryCharge: state.deliveryCharge,
          //TODO: get from logged in user
          customerEmail: "sgayangi@gmail.com",
          orderType: "normal",
          products: orderConfirmationProducts,
          address: new Address(
            streetAddress: state.streetAddress,
            city: state.city.city,
            district: state.city.district,
          ),
        );
        if (state.productListNeedPrescriptions.length == 0) {
          response = await orderAPIProvider
              .confirmNormalCashPrescriptionlessOrder(order);
        } else {
          order.hasPrescriptions = true;
          response =
              await orderAPIProvider.confirmNormalCashOrderWithPrescriptions(
                  order, state.localPhotoPaths);
        }

        if (response.orderID != null) {
          yield state.clone(
            orderLoading: false,
            orderID: response.orderID,
            localPhotoPaths: [],
            deliveryCharge: 0.0,
            streetAddress: "",
            city: new City(),
            district: "",
            productIDs: [],
            photos: [],
            productListPrescriptionless: [],
            productListTotal: 0,
            productListNeedPrescriptions: [],
          );
        }
        yield state.clone(
          error: "Order not confirmed. Please try again later.",
        );
        break;

      case ConfirmNormalOnlineOrder:
        yield state.clone(orderLoading: true);

        yield state.clone(orderLoading: false);
        break;

      case ConfirmPrescriptionOrder:
        yield state.clone(orderLoading: true);

        yield state.clone(orderLoading: false);
        break;
      case UpdateProductAmountEvent:
        double tempTotal = 0;
        for (OrderProduct p in state.productListPrescriptionless) {
          tempTotal += p.amountOrdered * p.actualPrice;
        }
        for (OrderProduct p in state.productListNeedPrescriptions) {
          tempTotal += p.amountOrdered * p.actualPrice;
        }
        yield state.clone(
          productListTotal: tempTotal,
        );
        break;
      case AddAddressDetails:
        var streetAddress = (event as AddAddressDetails).streetAddress;
        yield state.clone(
          streetAddress: streetAddress,
        );
        break;
      case GetAllCities:
        yield state.clone(
          orderLoading: true,
        );
        final result = await userApiProvider.getAllCities();
        if (result.containsKey("data")) {
          yield state.clone(
            orderLoading: false,
            city: result["data"].cities[0],
            cities: result["data"],
          );
        }
        break;
      case UpdateCity:
        final city = (event as UpdateCity).city;
        City newCity;
        for (City c in state.cities.cities) {
          if (c.description == city) {
            newCity = c;
          }
        }
        yield state.clone(
          city: newCity,
        );
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
