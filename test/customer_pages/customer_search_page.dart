import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_pharma/bloc/customer/search/search_bloc.dart';
import 'package:go_pharma/ui/customer/search_page/search_page_routing.dart';

void main() {
  testWidgets('Search renders properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => SearchBloc(context),
          child: SearchPageRouting(),
        ),
      ),
    );
    expect(find.text("Filter By:"), findsOneWidget);
  });
}
