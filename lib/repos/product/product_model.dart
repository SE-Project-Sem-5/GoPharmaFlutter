class Product {
  final String id;
  final String name;
  final String supplier;
  final bool inStock;
  final double price;
  final boolPrescriptionRequired;
  final String imageURL;
  final String description;
  int amountOrdered;
  String unitOfMeasure;

  Product({
    //TODO: get all info from database
    this.unitOfMeasure = "unit",
    required this.id,
    required this.name,
    this.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    required this.supplier,
    required this.inStock,
    required this.price,
    required this.boolPrescriptionRequired,
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
