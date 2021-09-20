import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_event.dart';
import 'package:go_pharma/bloc/customer/root/root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
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
              right: 25.0,
            ),
            child: ListView(
              children: <Widget>[
                BoldText(
                  text: 'Personal Information',
                  fontSize: 20.0,
                ),
                BoldText(
                  text: 'First Name',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your First Name",
                        ),
                        enabled: true,
                        autofocus: true,
                      )
                    : Text(
                        state.customer.firstName ?? "Customer First Name",
                      ),
                BoldText(
                  text: 'Last Name',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Last Name",
                        ),
                        enabled: true,
                        autofocus: true,
                      )
                    : Text(
                        state.customer.lastName ?? "Customer Last Name",
                      ),
                BoldText(
                  text: 'Last Name',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Last Name",
                        ),
                        enabled: true,
                        autofocus: true,
                      )
                    : Text(
                        state.customer.lastName ?? "Customer Last Name",
                      ),
                BoldText(
                  text: 'Email Address',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Email Address",
                        ),
                        enabled: true,
                      )
                    : Text(state.customer.email ?? "Customer Email"),
                BoldText(
                  text: 'Mobile Number',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Mobile Number",
                        ),
                        enabled: false,
                      )
                    : Text(
                        state.customer.phoneNumber ?? "Customer Mobile Number",
                      ),
                SizedBox(
                  height: 50.0,
                ),
                state.isEditable
                    ? Row(
                        children: [
                          Spacer(),
                          RoundedButtonFilled(
                            title: "Save",
                            widthMultiplier: 0.3,
                            size: MediaQuery.of(context).size,
                            fillColor: GoPharmaColors.PrimaryColor,
                            textColor: GoPharmaColors.WhiteColor,
                            onTapped: () {},
                          ),
                          Spacer(),
                          RoundedButtonFilled(
                            title: "Cancel",
                            widthMultiplier: 0.3,
                            size: MediaQuery.of(context).size,
                            fillColor: GoPharmaColors.GreyColor,
                            textColor: GoPharmaColors.BlackColor,
                            onTapped: () {
                              bloc.add(
                                ToggleEditableEvent(),
                              );
                            },
                          ),
                          Spacer(),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: RoundedButtonFilled(
                          title: "Edit Information",
                          widthMultiplier: 0.5,
                          size: MediaQuery.of(context).size,
                          fillColor: GoPharmaColors.GreyColor,
                          textColor: GoPharmaColors.BlackColor,
                          onTapped: () {
                            bloc.add(
                              ToggleEditableEvent(),
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
