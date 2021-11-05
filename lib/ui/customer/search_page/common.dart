import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/search/search_bloc.dart';
import 'package:go_pharma/bloc/customer/search/search_event.dart';
import 'package:go_pharma/bloc/customer/search/search_state.dart';
import 'package:go_pharma/ui/common/colors.dart';

class SearchFilterChip extends StatelessWidget {
  final String value;
  final String tag;

  const SearchFilterChip({
    Key key,
    @required this.value,
    @required this.tag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: FilterChip(
              label: Text(
                this.tag,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              selected: state.filter == value,
              onSelected: (bool v) {
                searchBloc.add(
                  UpdateFilterEvent(this.value),
                );
              },
              pressElevation: 15,
              selectedColor: GoPharmaColors.PrimaryColor,
            ));
      },
    );
  }
}
