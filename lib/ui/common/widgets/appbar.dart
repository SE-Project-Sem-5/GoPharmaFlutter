import 'package:flutter/material.dart';
import 'package:go_pharma/generated/l10n.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
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
            S.of(context).app_name,
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
