import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/profile/bold_text.dart';
import 'package:go_pharma/ui/customer/profile/verify_password.dart';

class DeliveryAgentSettingsPage extends StatelessWidget {
  static final String id = "delivery_agent_settings_page";
  const DeliveryAgentSettingsPage({Key key}) : super(key: key);

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

    var bloc = BlocProvider.of<DeliveryAgentRootBloc>(context);
    return BlocBuilder<DeliveryAgentRootBloc, DeliveryAgentRootState>(
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
              state.isGeneralInformationEditable
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Your First Name",
                      ),
                      enabled: true,
                      autofocus: true,
                    )
                  : InformationText(
                      text: "Customer First Name",
                    ),
              BoldText(
                text: 'Last Name',
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
                      text: "Customer Last Name",
                    ),
              BoldText(
                text: 'Gender',
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
                      text: "Gender",
                    ),
              BoldText(
                text: 'Date of Birth',
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
                      text: "Date of Birth",
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
                      text: "Customer Email",
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
                      text: "Customer Phone Number",
                    ),
              BoldText(
                text: 'Address',
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
                      text: "Customer Street Number",
                    ),
              state.isGeneralInformationEditable
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: "City",
                      ),
                      enabled: true,
                    )
                  : InformationText(
                      text: "Customer City",
                    ),
              state.isGeneralInformationEditable
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: "District",
                      ),
                      enabled: true,
                    )
                  : InformationText(
                      text: "Customer District",
                    ),
              state.isGeneralInformationEditable
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: "Province",
                      ),
                      enabled: true,
                    )
                  : InformationText(
                      text: "Customer Province",
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
