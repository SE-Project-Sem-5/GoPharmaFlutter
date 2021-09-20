class Product {
  final String id;
  final String name;
  final String brandName;
  final int category;
  final String categoryName;
  final String description;
  final int supplierID;

  final String supplier;
  final bool inStock;
  final double price;
  final bool prescriptionRequired;
  final String imageURL;
  int amountOrdered;
  String unitOfMeasure;

  Product({
    //TODO: get all info from database
    this.unitOfMeasure = "unit",
    this.id,
    this.name,
    this.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    this.supplier,
    this.inStock,
    this.price,
    this.prescriptionRequired,
    this.imageURL = "images/pills.png",
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
