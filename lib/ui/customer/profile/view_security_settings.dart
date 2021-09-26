import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';

import 'bold_text.dart';

class ProfileSecuritySettings extends StatelessWidget {
  static final String id = "Profile Security Settings";
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CustomerRootBloc>(context);
    var passwordController = TextEditingController();
    var twoFAController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Security Settings"),
        ),
        body: BlocBuilder<CustomerRootBloc, CustomerRootState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText(
                          padding: 0,
                          text: 'Password',
                          fontSize: 16.0,
                        ),
                        state.isGeneralInformationEditable
                            ? TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your First Name",
                                ),
                                enabled: true,
                                autofocus: true,
                              )
                            : InformationText(
                                text: "Password",
                              ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Change Password"),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText(
                          padding: 0,
                          text: 'Two-Factor Authentication',
                          fontSize: 16.0,
                        ),
                        state.isGeneralInformationEditable
                            ? TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your First Name",
                                ),
                                enabled: true,
                                autofocus: true,
                              )
                            : InformationText(
                                text: "ON",
                              ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Toggle Two Factor Authentication"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
