import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/text_field/text_field_bloc.dart';
import 'package:go_pharma/bloc/text_field/text_field_state.dart';

class TextFieldProvider extends BlocProvider<TextFieldBloc> {
  TextFieldProvider({
    required Key key,
  }) : super(
          key: key,
          create: (context) => TextFieldBloc(context),
          child: TestView(),
        );
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    final scaffold = Scaffold(
      body: BlocBuilder<TextFieldBloc, TextFieldState>(
        buildWhen: (pre, current) => true,
        builder: (context, state) {
          return Center(
            child: Text("Hi...Welcome to BLoC"),
          );
        },
      ),
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<TextFieldBloc, TextFieldState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: scaffold,
    );
  }
}
