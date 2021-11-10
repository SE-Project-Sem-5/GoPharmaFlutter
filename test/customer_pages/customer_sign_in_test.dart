import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in_2fa.dart';

void main() {
  testWidgets('Sign In page renders properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CustomerRootBloc(context),
          child: CustomerSignInPage(),
        ),
      ),
    );
    expect(find.text("Sign in to your account."), findsOneWidget);
  });

  testWidgets('Sign in 2FA page renders properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CustomerRootBloc(context),
          child: CustomerSignIn2FA(),
        ),
      ),
    );
    expect(find.widgetWithText(AppBar, "2FA Code"), findsOneWidget);
  });
}
