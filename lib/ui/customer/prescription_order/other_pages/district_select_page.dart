import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/common/colors.dart';

class DistrictSelectionPage extends StatelessWidget {
  static final String id = "select_district_page";
  const DistrictSelectionPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final prescriptionOrderBloc =
        BlocProvider.of<PrescriptionOrderBloc>(context);

    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      builder: (context, state) {
        return state.isDistrictsLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: state.districts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        prescriptionOrderBloc.add(SelectDistrictEvent(
                            selectedDistrict: state.districts[index]));
                      },
                      child: Card(
                        color: state.selectedDistricts
                                .contains(state.districts[index])
                            ? GoPharmaColors.SelectionColor.withOpacity(0.4)
                            : GoPharmaColors.WhiteColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 5.0,
                          ),
                          child: Text(
                            state.districts[index],
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
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
