import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/initial_routing_page.dart';
import 'package:intl/intl.dart';

import 'bold_text.dart';

class DeliveryAgentSettingsPage extends StatelessWidget {
  static final String id = "delivery_agent_settings_page";
  const DeliveryAgentSettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var contactNumberController = TextEditingController();
    var addressController = TextEditingController();
    var cityController = TextEditingController();
    var birthdayController = TextEditingController();

    var bloc = BlocProvider.of<DeliveryAgentRootBloc>(context);
    return BlocListener<DeliveryAgentRootBloc, DeliveryAgentRootState>(
      listenWhen: (context, state) {
        return state.signInState == DeliveryAgentRootSignInState.SIGNED_OUT;
      },
      listener: (context, state) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(
          context,
          InitialRoutingPage.id,
        );
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile Information",
            ),
          ),
          body: BlocBuilder<DeliveryAgentRootBloc, DeliveryAgentRootState>(
            builder: (context, state) {
              firstNameController.text = state.user.firstName ?? "First Name";
              lastNameController.text = state.user.lastName ?? "Last Name";
              birthdayController.text = state.user.dateOfBirth != null
                  ? state.user.dateOfBirth.substring(0, 10)
                  : "Date of Birth";
              contactNumberController.text =
                  state.user.contactNumber ?? "Contact Number";
              addressController.text = state.user.addressDetail != null
                  ? state.user.addressDetail.streetAddress
                  : "Address";
              cityController.text = state.user.addressDetail != null
                  ? state.user.addressDetail.provinceDistrictCity.toString()
                  : "Address";

              return Padding(
                padding: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    BoldText(
                      text: 'Registered Email Address',
                      fontSize: 16.0,
                    ),
                    InformationText(
                      text: state.user.userAccount != null
                          ? state.user.userAccount.email
                          : "Email",
                    ),
                    BoldText(
                      text: 'First Name',
                      fontSize: 16.0,
                    ),
                    state.isGeneralInformationEditable
                        ? TextField(
                            controller: firstNameController,
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
                      text: 'Last Name',
                      fontSize: 16.0,
                    ),
                    state.isGeneralInformationEditable
                        ? TextField(
                            controller: lastNameController,
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
                      text: 'Gender',
                      fontSize: 16.0,
                    ),
                    state.isGeneralInformationEditable
                        ? BlocBuilder<DeliveryAgentRootBloc,
                            DeliveryAgentRootState>(
                            buildWhen: (p, c) => p.gender != c.gender,
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Radio(
                                    activeColor: Theme.of(context).primaryColor,
                                    value: "male",
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      bloc.add(
                                        UpdateGenderEvent(
                                          gender: value,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Radio(
                                    activeColor: Theme.of(context).primaryColor,
                                    value: "female",
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      bloc.add(
                                        UpdateGenderEvent(gender: value),
                                      );
                                    },
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : InformationText(
                            text: state.user.gender != null
                                ? state.user.gender.toUpperCase()
                                : "Gender",
                          ),
                    BoldText(
                      text: "Date of Birth",
                      fontSize: 16.0,
                    ),
                    state.isGeneralInformationEditable
                        ? TextField(
                            controller: birthdayController,
                            decoration: InputDecoration(
                              hintText: "Date of Birth",
                              suffixIcon: GestureDetector(
                                child: new Icon(Icons.calendar_today),
                                onTap: () async {
                                  final datePick = await showDatePicker(
                                      context: context,
                                      initialDate: new DateTime(
                                          new DateTime.now().year - 18),
                                      firstDate: new DateTime(1900),
                                      lastDate: new DateTime(
                                          new DateTime.now().year - 18));
                                  if (datePick != null) {
                                    birthdayController.text =
                                        DateFormat("dd-MM-yyyy")
                                            .format(datePick)
                                            .toString();
                                  }
                                },
                              ),
                            ),
                            enabled: true,
                          )
                        : InformationText(
                            text: state.user.dateOfBirth.substring(0, 10),
                          ),
                    BoldText(
                      text: 'Mobile Number',
                      fontSize: 16.0,
                    ),
                    state.isGeneralInformationEditable
                        ? TextField(
                            controller: contactNumberController,
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
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: "Enter Street Address",
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
                        ? DropdownButton<String>(
                            value: state.city != null
                                ? state.city.description
                                : state.cities.cities[0].description,
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: GoPharmaColors.PrimaryColor,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              color: GoPharmaColors.BlackColor,
                              fontSize: 16,
                            ),
                            underline: Container(
                              height: 2,
                              color: GoPharmaColors.PrimaryColor,
                            ),
                            onChanged: (String newValue) {
                              print("Changing");
                              bloc.add(
                                UpdateCity(city: newValue),
                              );
                            },
                            items: state.cities.cities
                                .map<DropdownMenuItem<String>>((City value) {
                              return DropdownMenuItem<String>(
                                value: value.description,
                                child: Text(
                                  value.description,
                                ),
                              );
                            }).toList(),
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
                                onTapped: () {
                                  bloc.add(
                                    UpdateUserInformation(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      streetAddress: addressController.text,
                                      birthDate: birthdayController.text,
                                      gender: state.gender.toLowerCase(),
                                      contactNumber:
                                          contactNumberController.text,
                                    ),
                                  );
                                },
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
                                // RoundedButtonFilled(
                                //   title: "View Security Settings",
                                //   widthMultiplier: 0.5,
                                //   size: MediaQuery.of(context).size,
                                //   fillColor: GoPharmaColors.GreyColor,
                                //   textColor: GoPharmaColors.BlackColor,
                                //   onTapped: () {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => VerifyPassword(),
                                //       ),
                                //     );
                                //   },
                                // ),
                                RoundedButtonFilled(
                                  title: "Log Out",
                                  widthMultiplier: 0.5,
                                  size: MediaQuery.of(context).size,
                                  fillColor: GoPharmaColors.GreyColor,
                                  textColor: GoPharmaColors.BlackColor,
                                  onTapped: () {
                                    bloc.add(
                                      LogoutEvent(),
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
