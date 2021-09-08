import 'package:go_pharma/repos/delivery_agent/delivery/delivery_states.dart';

Map<String, Map<String, String>> buttonMapping = {
  deliveryStates[0]: {
    //scheduled
    "Next": "Confirm Pickup",
    "Previous": "Undo",
  },
  deliveryStates[1]: {
    //in transit
    "Next": "Confirm Delivery",
    "Previous": "Undo",
  },
  deliveryStates[2]: {
    //delivered
    "Next": "Confirm Payment",
    "Previous": "Undo",
  },
  deliveryStates[3]: {
    "Next": "Order Completed",
    "Previous": "Undo",
  },
};
