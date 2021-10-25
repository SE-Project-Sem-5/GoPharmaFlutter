import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/sign_up/verify_email_address.dart';
import 'package:intl/intl.dart';

class SignUpInformation extends StatelessWidget {
  static final String id = "customer_sign_up_information";
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CustomerRootBloc>(context);
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var contactNumberController = TextEditingController();
    var birthdayController = TextEditingController();
    var addressController = TextEditingController();
    return BlocListener<CustomerRootBloc, CustomerRootState>(
      listenWhen: (context, state) {
        return state.signUpProcessState == SignUpProcessState.FILLED;
      },
      listener: (context, state) {
        Navigator.pushReplacementNamed(
          context,
          VerifyEmailAddress.id,
        );
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Enter your details."),
          ),
          body: BlocBuilder<CustomerRootBloc, CustomerRootState>(
            builder: (context, state) {
              return state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
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
                          BlocBuilder<CustomerRootBloc, CustomerRootState>(
                            buildWhen: (p, c) => p.gender != c.gender,
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Gender: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Radio(
                                    activeColor: Theme.of(context).primaryColor,
                                    value: "male",
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      bloc.add(
                                          UpdateGenderEvent(gender: value));
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
                          ),
                          TextField(
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
                          ),
                          TextField(
                            controller: contactNumberController,
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                            ),
                            enabled: true,
                          ),
                          DropdownButton<String>(
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
                          ),
                          BlocBuilder<CustomerRootBloc, CustomerRootState>(
                            builder: (context, state) {
                              return RoundedButtonFilled(
                                title: "Next",
                                size: MediaQuery.of(context).size,
                                fillColor: GoPharmaColors.PrimaryColor,
                                textColor: GoPharmaColors.WhiteColor,
                                onTapped: () {
                                  print(firstNameController.text);
                                  print(lastNameController.text);
                                  print(addressController.text);
                                  print(birthdayController.text);
                                  print(state.gender);
                                  print(contactNumberController.text);
                                  bloc.add(
                                    SignUpCustomerInformationEvent(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      streetAddress: addressController.text,
                                      birthDate: birthdayController.text,
                                      gender: state.gender,
                                      contactNumber:
                                          contactNumberController.text,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
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
