import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_state.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/delivery_agent/components/delivery_state_button.dart';

class DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  const DeliveryCard({required this.delivery});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BlocBuilder<DeliveryBloc, DeliveryState>(
            builder: (context, state) {
              return Text(
                state.orderTransitionState.toString(),
              );
            },
          ),
          DeliveryStateButton(type: "Next"),
          DeliveryStateButton(type: "Previous"),
        ],
      ),
    );
  }
}
