import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

class DeliveryStatusChip extends StatelessWidget {
  final String text;
  final double width;

  DeliveryStatusChip({this.text, this.width = 76});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: GoPharmaColors.PrimaryColor.withOpacity(0.1),
      label: Container(
        width: width,
        child: Center(
          child: Text(
            text[0].toUpperCase() + text.substring(1).toLowerCase(),
          ),
        ),
      ),
    );
  }
}

class ChangeDeliveryStatusButton extends StatelessWidget {
  final String text;
  final double width;
  final Function onClick;
  final String status;

  const ChangeDeliveryStatusButton({
    this.text,
    this.width,
    this.onClick,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: GoPharmaColors.PrimaryColor,
      ),
      onPressed: onClick,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
