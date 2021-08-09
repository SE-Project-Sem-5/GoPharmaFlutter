import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/camera/camera_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_bloc.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/main_page.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/customer/checkout/checkout_bloc.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'generated/l10n.dart';

main() async {
  runApp(GoPharmaApp());
}

class GoPharmaApp extends StatelessWidget {
  Connectivity connectivity = Connectivity();
  // This widget is the root of your application.
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
          create: (_) => CheckoutBloc(_),
        ),
        BlocProvider<CameraBloc>(
          create: (_) => CameraBloc(_),
          //  TODO: move inside
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
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
          background: Container(
            color: GoPharmaColors.PrimaryColor,
          ),
        ),
        initialRoute: MainPage.id,
        // email.compareTo("Not logged in") == 0 ? SignInStart.id : HomePage.id,
        routes: routes,
        theme: buildThemeData(context),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
