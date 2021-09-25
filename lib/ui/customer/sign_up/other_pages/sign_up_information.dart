import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';

class SignUpInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CustomerSignUpBloc>(context);
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var contactNumberController = TextEditingController();
    var addressController = TextEditingController();
    var cityController = TextEditingController();
    var districtController = TextEditingController();
    var provinceController = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 25.0,
        right: 25.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Please enter your information",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: GoPharmaColors.PrimaryColor),
          ),
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(
              hintText: "First Name",
            ),
            enabled: true,
            autofocus: true,
          ),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              hintText: "Last Name",
            ),
            enabled: true,
          ),
          TextField(
            controller: contactNumberController,
            decoration: InputDecoration(
              hintText: "Mobile Number",
            ),
            enabled: true,
          ),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: "Street Address",
            ),
            enabled: true,
          ),
          TextField(
            controller: cityController,
            decoration: InputDecoration(
              hintText: "City",
            ),
            enabled: true,
          ),
          TextField(
            controller: districtController,
            decoration: InputDecoration(
              hintText: "District",
            ),
            enabled: true,
          ),
          TextField(
            controller: provinceController,
            decoration: InputDecoration(
              hintText: "Province",
            ),
            enabled: true,
          ),
          BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
            builder: (context, state) {
              return RoundedButtonFilled(
                title: "Next",
                size: MediaQuery.of(context).size,
                fillColor: GoPharmaColors.PrimaryColor,
                textColor: GoPharmaColors.WhiteColor,
                onTapped: () {
                  bloc.add(NextStepEvent(currentStep: state.step));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
