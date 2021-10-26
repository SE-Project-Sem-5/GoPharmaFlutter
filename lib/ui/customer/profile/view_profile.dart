import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/profile/bold_text.dart';
import 'package:go_pharma/ui/customer/profile/verify_password.dart';

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

    var bloc = BlocProvider.of<CustomerRootBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BoldText(
            text: "Profile",
            fontColor: Colors.white,
            padding: 0,
          ),
        ),
        body: BlocBuilder<CustomerRootBloc, CustomerRootState>(
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
                    text: "First Name",
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
                          text: state.user.firstName,
                        ),
                  BoldText(
                    text: "Last Name",
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Last Name",
                          ),
                          enabled: true,
                          autofocus: true,
                        )
                      : InformationText(
                          text: state.user.lastName,
                        ),
                  BoldText(
                    text: "Gender",
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Gender",
                          ),
                          enabled: true,
                          autofocus: true,
                        )
                      : InformationText(
                          text: state.user.gender,
                        ),
                  BoldText(
                    text: "Date of Birth",
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Date of Birth",
                          ),
                          enabled: true,
                          autofocus: true,
                        )
                      : InformationText(
                          text: state.user.dateOfBirth.substring(0, 10),
                        ),
                  BoldText(
                    text: 'Email Address',
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Email Address",
                          ),
                          enabled: true,
                        )
                      : InformationText(
                          text: state.user.userAccount.email,
                        ),
                  BoldText(
                    text: 'Mobile Number',
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Mobile Number",
                          ),
                          enabled: true,
                        )
                      : InformationText(
                          text: state.user.contactNumber,
                        ),
                  BoldText(
                    text: 'Address',
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Edit Address Information",
                          ),
                          enabled: true,
                        )
                      : InformationText(
                          text: state.user.addressDetail.streetAddress,
                        ),
                  BoldText(
                    text: 'City',
                    fontSize: 16.0,
                  ),
                  state.isGeneralInformationEditable
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: "Edit City Information",
                          ),
                          enabled: true,
                        )
                      : InformationText(
                          text: state.user.addressDetail.provinceDistrictCity
                              .toString(),
                        ),
                  state.isGeneralInformationEditable
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
                                  ToggleGeneralInformationEditableEvent(),
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
                          child: Column(
                            children: [
                              RoundedButtonFilled(
                                title: "Edit Information",
                                widthMultiplier: 0.5,
                                size: MediaQuery.of(context).size,
                                fillColor: GoPharmaColors.GreyColor,
                                textColor: GoPharmaColors.BlackColor,
                                onTapped: () {
                                  bloc.add(
                                    ToggleGeneralInformationEditableEvent(),
                                  );
                                },
                              ),
                              RoundedButtonFilled(
                                title: "View Security Settings",
                                widthMultiplier: 0.5,
                                size: MediaQuery.of(context).size,
                                fillColor: GoPharmaColors.GreyColor,
                                textColor: GoPharmaColors.BlackColor,
                                onTapped: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyPassword(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class InformationText extends StatelessWidget {
  final String text;
  final double padding;

  const InformationText({
    this.text,
    this.padding = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
