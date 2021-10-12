import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';
import 'package:go_pharma/ui/common/colors.dart';

class ZoneSelectionPage extends StatelessWidget {
  static final String id = "select_zone_page";
  const ZoneSelectionPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final prescriptionOrderBloc =
        BlocProvider.of<PrescriptionOrderBloc>(context);

    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Send prescription to all pharmacies within the",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: zones.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      prescriptionOrderBloc.add(
                        SelectZoneEvent(
                          zone: zones[index],
                        ),
                      );
                    },
                    child: Card(
                      color: state.zone == zones[index]
                          ? GoPharmaColors.SelectionColor.withOpacity(0.4)
                          : GoPharmaColors.WhiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 5.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            zones[index][0].toUpperCase() +
                                zones[index].substring(1),
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

List<String> zones = [
  "city",
  "district",
  "province",
  "country",
];
