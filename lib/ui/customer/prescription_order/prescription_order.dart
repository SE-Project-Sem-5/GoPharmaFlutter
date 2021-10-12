import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/drawer.dart';
import 'package:go_pharma/ui/customer/prescription_order/other_pages/order_summary_page.dart';
import 'other_pages/select_zone_page.dart';
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
          // ignore: missing_return
          onWillPop: () {
            prescriptionOrderBloc.add(
              PreviousStepEvent(
                currentStep: state.step,
                context: context,
              ),
            );
          },
          child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    state.orderLoading
                        ? "Your order is being processed..."
                        : titles[state.step],
                  ),
                ),
                drawer:
                    state.step == PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO
                        ? CustomerDrawer()
                        : null,
                body: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            if (state.step ==
                                PrescriptionOrderStep.PRESCRIPTIONORDER_ZONE) {
                              prescriptionOrderBloc.add(
                                NextStepEvent(
                                  currentStep: state.step,
                                  context: context,
                                ),
                              );
                              prescriptionOrderBloc.add(
                                ConfirmOrderEvent(),
                              );
                            } else {
                              state.step ==
                                      PrescriptionOrderStep
                                          .PRESCRIPTIONORDER_PHOTO
                                  ? state.localPhotoPaths.length > 0
                                      ? prescriptionOrderBloc.add(
                                          NextStepEvent(
                                            currentStep: state.step,
                                            context: context,
                                          ),
                                        )
                                      : null
                                  : state.step ==
                                          PrescriptionOrderStep
                                              .PRESCRIPTIONORDER_SUMMARY
                                      ? state.orderLoading
                                          ? null
                                          : prescriptionOrderBloc.add(
                                              NextStepEvent(
                                                currentStep: state.step,
                                                context: context,
                                              ),
                                            )
                                      : prescriptionOrderBloc.add(
                                          NextStepEvent(
                                            currentStep: state.step,
                                            context: context,
                                          ),
                                        );
                            }
                          },
                          fillColor: GoPharmaColors.PrimaryColor,
                          textColor: GoPharmaColors.WhiteColor,
                          title: state.localPhotoPaths.length > 0
                              ? state.step ==
                                      PrescriptionOrderStep
                                          .PRESCRIPTIONORDER_SUMMARY
                                  ? "Return to Home Page"
                                  : "Next"
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
