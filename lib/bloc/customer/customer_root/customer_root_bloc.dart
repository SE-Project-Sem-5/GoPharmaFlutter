import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/user.dart';
import 'package:go_pharma/repos/common/signup/userAPIProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRootBloc extends Bloc<CustomerRootEvent, CustomerRootState> {
  final UserAPIProvider userApiProvider = new UserAPIProvider();
  CustomerRootBloc(BuildContext context)
      : super(CustomerRootState.initialState) {
    _init();
  }

  Future<void> _init() async {
    var prefs = await SharedPreferences.getInstance();
    final accessToken = (prefs.getString('accessToken') ?? '');
    if (accessToken != '') {
      Map<String, User> user =
          await userApiProvider.getCurrentUser(accessToken);
      if (user.containsKey("user")) {
        add(UpdateUserEvent(user["user"]));
      }
    } else {
      add(
        ChangeSignInStateEvent(
          CustomerRootSignInState.SIGNED_OUT,
        ),
      );
    }
  }

  @override
  Stream<CustomerRootState> mapEventToState(CustomerRootEvent event) async* {
    switch (event.runtimeType) {
      case RootErrorEvent:
        final error = (event as RootErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case SignUpCustomerEvent:
        final email = (event as SignUpCustomerEvent).email;
        final password = (event as SignUpCustomerEvent).password;
        final role = "customer";
        final user = state.user;
        final Map<String, String> result = await userApiProvider.signUpUser(
          email: email,
          password: password,
          role: role,
        );
        if (result.containsKey("success")) {
          user.email = email;
          user.password = password;
          yield state.clone(
            signUpProcessState: SignUpProcessState.INITIATED,
            user: user,
          );
        } else {}
        break;
      case UpdateUserEvent:
        final user = (event as UpdateUserEvent).user;
        yield state.clone(user: user);
        break;
      case UpdateTwoFA:
        final twoFA = (event as UpdateTwoFA).twoFA;
        yield state.clone(
          twoFA: twoFA,
        );
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(RootErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(RootErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
