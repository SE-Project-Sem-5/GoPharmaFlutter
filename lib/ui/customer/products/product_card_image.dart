import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

class ProductCardImage extends StatelessWidget {
  final double height;
  final double width;
  final double padding;

  const ProductCardImage({
    Key key,
    this.imageURL,
    this.height = 125.0,
    this.width = 125.0,
    this.padding = 10,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: GoPharmaColors.PrimaryColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: ExactAssetImage(
            imageURL,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
