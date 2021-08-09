import 'package:flutter/material.dart';

import '../colors.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  const CustomBackButton({
    Key? key,
    this.color = GoPharmaColors.PrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: this.color,
    );
  }
}
