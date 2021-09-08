import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import '../../../../repos/delivery_agent/delivery/delivery_states.dart';

Map<String, Color> deliveryStatusColorMapping = {
  deliveryStates[0]: GoPharmaColors.PrimaryColor.withOpacity(0.2),
  deliveryStates[1]: Colors.blueAccent.withOpacity(0.2),
  deliveryStates[2]: Colors.green.withOpacity(0.2),
};
