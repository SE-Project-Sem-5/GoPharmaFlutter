import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/processing_orders/normal_orders/processing_normal_orders_page.dart';
import 'package:go_pharma/ui/customer/processing_orders/prescription_orders/processing_prescription_orders_page.dart';

class SelectProcessingOrderType extends StatelessWidget {
  static const id = "select_processing_order_type";
  final String title = "Select Order Type.";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(title),
            ],
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButtonFilled(
                title: "Prescription Orders",
                size: size,
                onTapped: () => Navigator.pushNamed(
                  context,
                  ProcessingPrescriptionOrdersPage.id,
                ),
              ),
              RoundedButtonFilled(
                title: "Normal Orders",
                size: size,
                fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                textColor: GoPharmaColors.BlackColor,
                onTapped: () => Navigator.pushNamed(
                  context,
                  ProcessingNormalOrdersPage.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
