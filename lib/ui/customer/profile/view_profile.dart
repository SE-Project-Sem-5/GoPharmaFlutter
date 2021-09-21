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
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var emailController = TextEditingController();
    var contactNumberController = TextEditingController();
    var addressController = TextEditingController();
    var districtController = TextEditingController();
    var provinceController = TextEditingController();
    var cityController = TextEditingController();

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
              left: 25.0,
              right: 25.0,
            ),
            child: ListView(
              physics: ClampingScrollPhysics(),
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
                    : InformationText(
                        "Customer First Name",
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
                    : InformationText(
                        "Customer Email",
                      ),
                BoldText(
                  text: 'Mobile Number',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Mobile Number",
                        ),
                        enabled: true,
                      )
                    : InformationText(
                        "Customer Phone Number",
                      ),
                BoldText(
                  text: 'Address',
                  fontSize: 16.0,
                ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Mobile Number",
                        ),
                        enabled: true,
                      )
                    : InformationText(
                        "Customer Street Number",
                      ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "City",
                        ),
                        enabled: true,
                      )
                    : InformationText(
                        "Customer City",
                      ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "District",
                        ),
                        enabled: true,
                      )
                    : InformationText(
                        "Customer District",
                      ),
                state.isEditable
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: "Province",
                        ),
                        enabled: true,
                      )
                    : InformationText(
                        "Customer Province",
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

class InformationText extends StatelessWidget {
  final String text;

  const InformationText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
