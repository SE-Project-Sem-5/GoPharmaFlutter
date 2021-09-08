import 'package:flutter/material.dart';
import 'package:go_pharma/ui/delivery_agent/delivery/state_mappings/color_mapping.dart';

class DeliveryStatusChip extends StatelessWidget {
  final String text;
  DeliveryStatusChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: deliveryStatusColorMapping[text],
      label: Container(
        width: 75,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
