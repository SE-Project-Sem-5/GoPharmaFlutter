import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/checkout/payment_option_selection.dart';

class AddressInformationPage extends StatelessWidget {
  static final String id = "address_details_page";
  final _form = GlobalKey<FormState>();
  TextEditingController addressController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: TextFormField(
                        controller: cityController,
                        // ignore: missing_return
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please pick a city");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "City",
                        ),
                        enabled: true,
                      ),
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
                Navigator.pushNamed(
                  context,
                  PaymentSelectionPage.id,
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
              "Proceed to Payment",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
