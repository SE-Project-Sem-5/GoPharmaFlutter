import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/deliveryDetails.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderPriceInformation.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';
import 'dart:async';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(BuildContext context) : super(CheckoutState.initialState);
  OrderAPIProvider orderAPIProvider = new OrderAPIProvider();
  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(
          error: error,
        );
        break;
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
          deliveryProducts.add(newDeliveryProduct);
        }
        DeliveryDetails delivery = new DeliveryDetails(
          customerAddressID: 2,
          city: "Kalutara",
          streetAddress: "12/SD/4, Floor 12, City Place",
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
      case ConfirmNormalCashOrder:
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
