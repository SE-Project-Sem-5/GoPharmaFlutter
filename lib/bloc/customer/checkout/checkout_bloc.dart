import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';
import 'dart:async';

import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(BuildContext context) : super(CheckoutState.initialState);

  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        // yield state.clone(error: "", productList: [], productListTotal: 0);
        yield state.clone(
          error: error,
          productListPrescriptionless: [],
          productListTotal: 0,
          productListNeedPrescriptions: [],
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

        final prescriptionNeeded = product.prescriptionRequired;

        List<Product> productListPrescriptionless =
            state.productListPrescriptionless;
        List<Product> productListNeedPrescriptions =
            state.productListNeedPrescriptions;

        double tempTotal = state.productListTotal;

        if (productListPrescriptionless.contains(product) ||
            productListNeedPrescriptions.contains(product)) {
          if (prescriptionNeeded) {
            productListNeedPrescriptions.remove(product);
          } else {
            productListPrescriptionless.remove(product);
          }
          tempTotal -= product.price * product.amountOrdered;
          product.amountOrdered = 0;
        } else {
          product.incrementAmount();
          if (prescriptionNeeded) {
            productListNeedPrescriptions.add(product);
          } else {
            productListPrescriptionless.add(product);
          }
          tempTotal += product.price;
        }
        yield state.clone(
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
      case ConfirmOrderEvent:
        yield state.clone(orderLoading: true);
        //TODO: call endpoint to upload images
        yield state.clone(orderLoading: false);
        break;
      case UpdateProductAmountEvent:
        double tempTotal = 0;
        for (Product p in state.productListPrescriptionless) {
          tempTotal += p.amountOrdered * p.price;
        }
        for (Product p in state.productListNeedPrescriptions) {
          tempTotal += p.amountOrdered * p.price;
        }
        yield state.clone(
          error: '',
          productListPrescriptionless: state.productListPrescriptionless,
          productListTotal: tempTotal,
          productListNeedPrescriptions: state.productListNeedPrescriptions,
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
