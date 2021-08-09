import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedButtonFilled extends StatelessWidget {
  const RoundedButtonFilled({
    required this.size,
    this.fillColor = GoPharmaColors.PrimaryColor,
    this.textColor = Colors.white,
    this.height = 65.0,
    this.widthMultiplier = 0.8,
    this.hPadding = 20.0,
    this.vPadding = 10.0,
    required this.onTapped,
    required this.title,
  });

  final Size size;
  final Color fillColor;
  final Color textColor;
  final double height;
  final double widthMultiplier;
  final double hPadding;
  final double vPadding;
  final VoidCallback onTapped;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: this.hPadding,
        vertical: this.vPadding,
      ),
      child: Container(
        width: size.width * this.widthMultiplier,
        height: this.height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: this.textColor,
            backgroundColor: this.fillColor,
            side: BorderSide(
              color: this.fillColor,
              width: 0.0,
            ),
          ),
          onPressed: onTapped,
          child: Text(
            this.title,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
