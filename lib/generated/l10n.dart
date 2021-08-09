// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `GoPharma`
  String get app_name {
    return Intl.message(
      'GoPharma',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next_button_text {
    return Intl.message(
      'Next',
      name: 'next_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get your_email {
    return Intl.message(
      'Your Email',
      name: 'your_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in_heading {
    return Intl.message(
      'Sign In',
      name: 'sign_in_heading',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get sign_in_to_your_account {
    return Intl.message(
      'Sign in to your account',
      name: 'sign_in_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get sign_up_button {
    return Intl.message(
      'SIGN UP',
      name: 'sign_up_button',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get no_account_text {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'no_account_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign up.`
  String get sign_up_text {
    return Intl.message(
      'Sign up.',
      name: 'sign_up_text',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
