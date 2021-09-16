import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';

import 'other_pages/district_select_page.dart';
import 'other_pages/select_photo_screen.dart';

class PrescriptionOrderPage extends StatelessWidget {
  const PrescriptionOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prescriptionOrderBloc =
        BlocProvider.of<PrescriptionOrderBloc>(context);

    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return CommonSkeleton(
          title: 'Title',
          child: Container(),
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
}
