import 'package:flutter/material.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';

class SettingsPage extends StatelessWidget {
  static final String id = "customer_settings_page";
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSkeleton(
      title: "Settings",
      child: Container(),
    );
  }
}
