import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';

class SearchPageRouting extends StatelessWidget {
  static final String id = "search_page_routing";
  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerRootBloc, CustomerRootState>(
      listenWhen: (context, state) {},
      listener: (context, state) {},
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: SizedBox(),
            title: Text(
              "Search By...",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              children: <Widget>[
                Spacer(),
                RoundedButtonFilled(
                  title: "Yes",
                  size: MediaQuery.of(context).size,
                  fillColor: GoPharmaColors.PrimaryColor,
                  textColor: GoPharmaColors.WhiteColor,
                  onTapped: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButtonFilled(
                  title: "No",
                  size: MediaQuery.of(context).size,
                  fillColor: GoPharmaColors.GreyColor,
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () {},
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
