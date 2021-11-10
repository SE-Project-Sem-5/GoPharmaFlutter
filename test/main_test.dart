import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/ui/customer/profile/verify_password.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in_2fa.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up_information.dart';
import 'package:go_pharma/ui/customer/sign_up/enable_two_fa_question.dart';
import 'package:go_pharma/ui/customer/sign_up/sign_up_start.dart';
import 'package:go_pharma/ui/initial_routing_page.dart';

void main() {
  testWidgets('Startup page renders properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: InitialRoutingPage(),
      ),
    );
    expect(
        find.text("Are you a customer, or a delivery agent?"), findsOneWidget);
  });

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

  testWidgets('Sign up information page renders properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CustomerRootBloc(context),
          child: SignUpInformation(),
        ),
      ),
    );
    expect(find.widgetWithText(AppBar, "Enter your details."), findsOneWidget);
  });

  testWidgets('Sign up enabling 2FA page renders properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CustomerRootBloc(context),
          child: EnableTwoFAQuestion(),
        ),
      ),
    );
    expect(find.widgetWithText(AppBar, "Turn 2FA On?"), findsOneWidget);
  });

  testWidgets('Sign up start page renders properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CustomerRootBloc(context),
          child: CustomerSignUpPage(),
        ),
      ),
    );
    expect(find.widgetWithText(AppBar, "SIGN UP"), findsOneWidget);
  });
}
