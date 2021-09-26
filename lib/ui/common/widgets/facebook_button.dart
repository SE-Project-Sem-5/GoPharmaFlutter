import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    Key key,
    @required this.size,
    @required this.onClick,
    @required this.title,
  }) : super(key: key);

  final Size size;
  final Function onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      buttonH: 50,
      buttonW: size.width * 0.8,
      iconWidget: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          FontAwesomeIcons.facebookF,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      title: title,
      titleColor: Colors.white,
      colour: GoPharmaColors.FacebookBlueColor,
      borderColor: GoPharmaColors.FacebookBlueColor,
      onPressed: onClick,
    );
  }
}
