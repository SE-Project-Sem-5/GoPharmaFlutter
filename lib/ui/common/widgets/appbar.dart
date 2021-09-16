import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "GoPharma",
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
