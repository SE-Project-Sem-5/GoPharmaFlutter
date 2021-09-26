import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/common/colors.dart';

class DeliveryStatusChip extends StatelessWidget {
  final String text;
  final double width;

  DeliveryStatusChip({this.text, this.width = 76});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: deliveryStatusColorMapping[text.toLowerCase()] ??
          GoPharmaColors.PrimaryColor.withOpacity(0.1),
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

Map<String, Color> deliveryStatusColorMapping = {
  deliveryStates[0]: GoPharmaColors.PrimaryColor.withOpacity(0.2),
  deliveryStates[1]: Colors.blueAccent.withOpacity(0.2),
  deliveryStates[2]: Colors.red.withOpacity(0.2),
  deliveryStates[3]: Colors.yellow.withOpacity(0.2),
  deliveryStates[4]: Colors.green.withOpacity(0.2),
};
