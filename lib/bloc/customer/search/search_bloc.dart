import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/search/search_event.dart';
import 'package:go_pharma/bloc/customer/search/search_state.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(BuildContext context) : super(SearchState.initialState);

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(
          error: error,
        );
        break;
      case ProductSearchEvent:
        final String filter = (event as ProductSearchEvent).filter;
        final String searchValue = (event as ProductSearchEvent).searchValue;

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
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
