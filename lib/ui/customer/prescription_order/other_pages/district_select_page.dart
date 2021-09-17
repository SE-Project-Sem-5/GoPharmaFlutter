import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';

class DistrictSelectionPage extends StatelessWidget {
  static final String id = "select_district_page";
  const DistrictSelectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      builder: (context, state) {
        print(state.districts);
        return CommonSkeleton(
          title: "Select a District",
          child: state.isDistrictsLoading
              ? CircularProgressIndicator()
              : Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: state.districts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Text(state.districts[index]),
                  ),
                ),
        );
      },
    );
  }
}
