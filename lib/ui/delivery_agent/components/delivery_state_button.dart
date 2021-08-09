import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_state.dart';

class DeliveryStateButton extends StatelessWidget {
  final String type;
  const DeliveryStateButton({required this.type});

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
                NextDeliveryStatusEvent(state.orderTransitionState),
              );
            } else {
              bloc.add(
                PreviousDeliveryStatusEvent(state.orderTransitionState),
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
