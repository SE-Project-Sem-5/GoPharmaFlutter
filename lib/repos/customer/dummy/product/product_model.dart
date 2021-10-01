import 'package:go_pharma/repos/customer/actual/product/product.dart';

class OrderProduct {
  final int id;
  final String productName;
  final double actualPrice;
  int amountOrdered;
  String unitOfMeasure;
  final Product product;

  OrderProduct({
    this.product,
    this.unitOfMeasure = "unit",
    this.id,
    this.productName,
    this.actualPrice,
    this.amountOrdered = 0,
  });

  void incrementAmount() {
    this.amountOrdered += 1;
    this.unitOfMeasure = "units";

    if (this.amountOrdered == 1) {
      this.unitOfMeasure = "unit";
    }
  }

  void decrementAmount() {
    if (this.amountOrdered > 1) {
      this.amountOrdered -= 1;
    }
    if (this.amountOrdered == 1) {
      this.unitOfMeasure = "unit";
    }
  }
}
