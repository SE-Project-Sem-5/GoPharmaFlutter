import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/order_summary_page.dart';

import '../drawer.dart';
import 'other_pages/zone_select_page.dart';
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
        return WillPopScope(
          onWillPop: () {
            prescriptionOrderBloc
                .add(PreviousStepEvent(currentStep: state.step));
          },
          child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    titles[state.step],
                  ),
                ),
                drawer:
                    state.step == PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO
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
                bottomNavigationBar: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: BlocBuilder<PrescriptionOrderBloc,
                        PrescriptionOrderState>(
                      builder: (context, state) {
                        return RoundedButtonFilled(
                          size: MediaQuery.of(context).size,
                          onTapped: () {
                            state.step ==
                                    PrescriptionOrderStep
                                        .PRESCRIPTIONORDER_PHOTO
                                ? state.localPhotoPaths.length > 0
                                    ? prescriptionOrderBloc.add(
                                        NextStepEvent(
                                          currentStep: state.step,
                                        ),
                                      )
                                    : null
                                : prescriptionOrderBloc.add(
                                    NextStepEvent(
                                      currentStep: state.step,
                                    ),
                                  );
                          },
                          fillColor: GoPharmaColors.PrimaryColor,
                          textColor: GoPharmaColors.WhiteColor,
                          title: state.localPhotoPaths.length > 0
                              ? "Next"
                              : "Select an Image",
                        );
                      },
                    ),
                  ),
                )),
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
      case PrescriptionOrderStep.PRESCRIPTIONORDER_ZONE:
        return ZoneSelectionPage();
        break;
      case PrescriptionOrderStep.PRESCRIPTIONORDER_SUMMARY:
        return OrderSummaryPage();
        break;
    }
  }

  Map<PrescriptionOrderStep, String> titles = {
    PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO: "Upload Prescription",
    PrescriptionOrderStep.PRESCRIPTIONORDER_ZONE: "Select a Zone",
    PrescriptionOrderStep.PRESCRIPTIONORDER_SUMMARY: "Order Summary",
  };
}
