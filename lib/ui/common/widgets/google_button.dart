import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key key,
    @required this.size,
    this.onClick,
    this.title,
  }) : super(key: key);

  final Size size;
  final Function onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      buttonW: size.width * 0.8,
      buttonH: 50,
      iconWidget: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          FontAwesomeIcons.google,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      title: title,
      titleColor: Colors.white,
      colour: GoPharmaColors.GoogleBlueColor,
      borderColor: GoPharmaColors.GoogleBlueColor,
      onPressed: onClick,
    );
  }
}
