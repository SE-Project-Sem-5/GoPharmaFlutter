import 'package:flutter/material.dart';

import 'drawer.dart';

class CommonSkeleton extends StatelessWidget {
  final Widget child;
  final String title;
  CommonSkeleton({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
        drawer: CustomerDrawer(),
      ),
    );
  }
}
