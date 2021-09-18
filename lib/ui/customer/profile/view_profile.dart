import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_state.dart';
import 'package:go_pharma/ui/customer/profile/bold_text.dart';

class SettingsPage extends StatelessWidget {
  static final String id = "customer_settings_page";
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RootBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: BoldText(
            text: "PROFILE",
            fontColor: Colors.white,
            padding: 0,
          ),
        ),
        body: BlocBuilder<RootBloc, RootState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 25.0,
                left: 25.0,
              ),
              child: ListView(
                children: <Widget>[
                  BoldText(
                    text: 'Personal Information',
                    fontSize: 20.0,
                  ),
                  BoldText(
                    text: 'Name',
                    fontSize: 16.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Name",
                    ),
                    enabled: false,
                    autofocus: true,
                  ),
                  BoldText(
                    text: 'Email Address',
                    fontSize: 16.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email Address",
                    ),
                    enabled: false,
                  ),
                  BoldText(
                    text: 'Mobile Number',
                    fontSize: 16.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                    ),
                    enabled: false,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
