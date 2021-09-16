import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

class ProductActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ProductActionIcon({
    Key key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: Random().nextInt(100000).toString(),
          child: Icon(
            this.icon,
            color: Colors.black87,
          ),
          backgroundColor: GoPharmaColors.GreyColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
