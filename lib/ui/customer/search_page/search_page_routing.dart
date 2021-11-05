import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';

import 'common.dart';

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
                FilterChipSearch(
                  tag: "Brand",
                  value: "productBrand",
                ),
                SizedBox(
                  height: 20,
                ),
                FilterChipSearch(
                  tag: "Product",
                  value: "productName",
                ),
                SizedBox(
                  height: 20,
                ),
                FilterChipSearch(
                  tag: "Supplier",
                  value: "productSupplier",
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
