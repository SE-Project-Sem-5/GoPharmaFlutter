import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_bloc.dart';
import 'package:go_pharma/ui/initial_routing_page.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'bloc/customer/checkout/checkout_bloc.dart';
import 'config/routes.dart';
import 'config/theme.dart';

main() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = prefs.getString('email');
  bool isLoggedIn = true;

  runApp(
    GoPharmaApp(isLoggedIn: isLoggedIn),
  );
}

class GoPharmaApp extends StatelessWidget {
  bool isLoggedIn = false;
  Connectivity connectivity = Connectivity();
  // This widget is the root of your application.
  GoPharmaApp({this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(
            context,
            connectivity,
          ),
        ),
        BlocProvider<CheckoutBloc>(
          create: (context) => CheckoutBloc(context),
        ),
        BlocProvider<RootBloc>(
          create: (context) => RootBloc(context),
        ),
        BlocProvider<PrescriptionOrderBloc>(
          create: (context) => PrescriptionOrderBloc(context),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
        initialRoute: InitialRoutingPage.id,
        // email.compareTo("Not logged in") == 0 ? SignInStart.id : HomePage.id,
        routes: routes,
        theme: buildThemeData(context),
        // supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
