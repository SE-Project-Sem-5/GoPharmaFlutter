import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';

class SignUpInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CustomerSignUpBloc>(context);

    return Column(
      children: [
        BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
          builder: (context, state) {
            return RoundedButtonFilled(
              title: "Next",
              size: MediaQuery.of(context).size,
              fillColor: GoPharmaColors.PrimaryColor,
              textColor: GoPharmaColors.WhiteColor,
              onTapped: () {
                bloc.add(NextStepEvent(currentStep: state.step));
              },
            );
          },
        ),
      ],
    );
  }
}
