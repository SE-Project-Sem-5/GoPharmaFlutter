import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'package:go_pharma/ui/customer/profile/view_security_settings.dart';
import 'bold_text.dart';

class VerifyPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CustomerRootBloc>(context);
    TextEditingController passwordController = new TextEditingController();
    final _form = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Verify Password"),
        ),
        body: BlocBuilder<CustomerRootBloc, CustomerRootState>(
          builder: (context, state) {
            return Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoldText(
                    text: 'Please enter your current password.',
                    fontSize: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: TextFieldContainer(
                      child: TextFormField(
                        controller: passwordController,
                        //ignore: missing_return
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please type in your password.");
                          }
                        },
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        obscureText: !state.isVisible,
                        onChanged: (String value) {},
                        cursorColor: GoPharmaColors.PrimaryColor,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: GoPharmaColors.hintTextColor,
                            fontSize: 18.0,
                          ),
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            child: Icon(
                              state.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: GoPharmaColors.PrimaryColor,
                            ),
                            onTap: () {
                              bloc.add(
                                ToggleVisibility(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  RoundedButtonFilled(
                    title: "Submit",
                    size: MediaQuery.of(context).size,
                    fillColor: GoPharmaColors.PrimaryColor,
                    textColor: GoPharmaColors.WhiteColor,
                    onTapped: () {
                      if (_form.currentState.validate()) {
                        Navigator.pushReplacementNamed(
                          context,
                          ProfileSecuritySettings.id,
                        );
                      }
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
