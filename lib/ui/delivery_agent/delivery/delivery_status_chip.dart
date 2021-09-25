import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/common/colors.dart';

class DeliveryStatusChip extends StatelessWidget {
  final String text;
  DeliveryStatusChip({this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: deliveryStatusColorMapping[text.toLowerCase()],
      label: Container(
        width: 75,
        child: Center(
          child: Text(
            text[0].toUpperCase() + text.substring(1).toLowerCase(),
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
