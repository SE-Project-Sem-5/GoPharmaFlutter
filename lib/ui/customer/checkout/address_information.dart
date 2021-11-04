import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_receipt.dart';

class AddressInformationPage extends StatelessWidget {
  static final String id = "address_details_page";
  final _form = GlobalKey<FormState>();
  TextEditingController addressController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);

    return BlocBuilder<CheckoutBloc, CheckoutState>(
      buildWhen: (p, c) => p.orderLoading != c.orderLoading,
      builder: (context, state) {
        return SafeArea(
          child: state.orderLoading
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  // resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    title: Text("Delivery Address Details"),
                  ),
                  body: Container(
                    child: BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        return Form(
                          key: _form,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Please enter your delivery information.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                ),
                                child: TextFormField(
                                  controller: addressController,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return ("Please enter your address");
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Street Address",
                                  ),
                                  enabled: true,
                                ),
                              ),
                              SizedBox(
                                height: 30,
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
                                    .map<DropdownMenuItem<String>>(
                                        (City value) {
                                  return DropdownMenuItem<String>(
                                    value: value.description,
                                    child: Text(
                                      value.description,
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 30.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_form.currentState.validate()) {
                          bloc.add(
                            AddAddressDetails(
                              streetAddress: addressController.text,
                              city: cityController.text,
                            ),
                          );
                          bloc.add(GetDeliveryChargeForNormalOrder());
                          Navigator.pushNamed(
                            context,
                            CheckoutReceipt.id,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: GoPharmaColors.PrimaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(
                        "View Delivery Charges",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
