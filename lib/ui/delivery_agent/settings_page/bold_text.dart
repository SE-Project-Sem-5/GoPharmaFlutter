import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final String text;
  final Color fontColor;
  final double padding;
  const BoldText({
    this.text,
    Key key,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.bold,
    this.fontColor = Colors.black,
    this.padding = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: this.padding,
        top: this.padding,
      ),
      child: new Text(
        this.text,
        style: TextStyle(
          fontWeight: this.fontWeight,
          fontSize: this.fontSize,
          color: this.fontColor,
        ),
      ),
    );
  }
}
