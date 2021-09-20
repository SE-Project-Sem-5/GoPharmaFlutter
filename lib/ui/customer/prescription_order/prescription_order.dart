import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';

import '../drawer.dart';
import 'other_pages/district_select_page.dart';
import 'other_pages/select_photo_screen.dart';

class PrescriptionOrderPage extends StatelessWidget {
  static final String id = "prescription_order";

  @override
  Widget build(BuildContext context) {
    final prescriptionOrderBloc =
        BlocProvider.of<PrescriptionOrderBloc>(context);

    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                titles[state.step],
              ),
            ),
            drawer: state.step == PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO
                ? CustomerDrawer()
                : null,
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  pageSwitcher(state.step),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            bottomNavigationBar:
                state.step == PrescriptionOrderStep.PRESCRIPTIONORDER_DISTRICT
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 20.0,
                          ),
                          child: RoundedButtonFilled(
                            size: MediaQuery.of(context).size,
                            onTapped: () {},
                            fillColor: GoPharmaColors.PrimaryColor,
                            textColor: GoPharmaColors.WhiteColor,
                            title: "Confirm Prescription Order",
                          ),
                        ),
                      )
                    : null,
          ),
        );
      },
    );
  }

  Widget pageSwitcher(PrescriptionOrderStep step) {
    switch (step) {
      case PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO:
        return SelectPhotoScreen();
        break;
      case PrescriptionOrderStep.PRESCRIPTIONORDER_DISTRICT:
        return DistrictSelectionPage();
        break;
    }
  }

  Map<PrescriptionOrderStep, String> titles = {
    PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO: "Upload Prescription",
    PrescriptionOrderStep.PRESCRIPTIONORDER_DISTRICT: "Select a District",
  };
}
