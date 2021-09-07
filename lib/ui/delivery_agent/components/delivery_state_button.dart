import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_state.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';

class DeliveryStateButton extends StatelessWidget {
  final String type;
  final Delivery delivery;
  const DeliveryStateButton({required this.type, required this.delivery});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DeliveryBloc>(context);
    return BlocBuilder<DeliveryBloc, DeliveryState>(
      builder: (context, state) {
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: Colors.white,
            side: BorderSide(
              width: 0.0,
            ),
          ),
          onPressed: () {
            if (this.type == "Next") {
              bloc.add(
                NextDeliveryStatusEvent(
                  state.orderTransitionState,
                  delivery,
                ),
              );
            } else {
              bloc.add(
                PreviousDeliveryStatusEvent(
                  state.orderTransitionState,
                  delivery,
                ),
              );
            }
          },
          child: Text(
            this.type,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        );
      },
    );
  }
}
