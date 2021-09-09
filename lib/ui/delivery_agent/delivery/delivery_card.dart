import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_state.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/delivery_agent/components/delivery_state_button.dart';
import 'package:go_pharma/ui/delivery_agent/delivery/delivery_full_view.dart';

import 'delivery_status_chip.dart';

class DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  const DeliveryCard({required this.delivery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeliveryFullView(
                delivery: delivery,
              ),
            ),
          );
        },
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.article_rounded,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(delivery.id),
                    Text(
                      "Rs. " + delivery.totalPrice.toStringAsFixed(2),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<DeliveryBloc, DeliveryState>(
                      builder: (context, state) {
                        print(delivery.deliveryStatus);
                        return DeliveryStatusChip(
                          text: delivery.deliveryStatus,
                        );
                      },
                    ),
                  ),
                  DeliveryStateButton(
                    type: "Next",
                    delivery: delivery,
                  ),
                  const SizedBox(width: 8),
                  // DeliveryStateButton(
                  //   type: "Previous",
                  //   delivery: delivery,
                  // ),
                  // const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
