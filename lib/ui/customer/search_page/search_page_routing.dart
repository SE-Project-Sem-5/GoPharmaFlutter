import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/search/search_bloc.dart';
import 'package:go_pharma/bloc/customer/search/search_event.dart';
import 'package:go_pharma/bloc/customer/search/search_state.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';
import 'package:go_pharma/ui/customer/products/product_full_view.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'common.dart';
import 'package:go_pharma/repos/customer/actual/product/product.dart';

class SearchPageRouting extends StatelessWidget {
  static final String id = "search_page_routing";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 90,
                left: 20,
              ),
              child: Text(
                "Filter By:",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  SearchFilterChip(
                    tag: "Brand",
                    value: "productBrand",
                  ),
                  Spacer(),
                  SearchFilterChip(
                    tag: "Product",
                    value: "productName",
                  ),
                  Spacer(),
                  SearchFilterChip(
                    tag: "Supplier",
                    value: "productSupplier",
                  ),
                  Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildFloatingSearchBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: FloatingSearchBar(
        hint: 'Search...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          // Call your model, bloc, controller here.
          if (query.length > 3) {
            searchBloc.add(
              ProductSearchEvent(
                searchValue: query,
              ),
            );
          }
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.searchResults[state.filter].products.length == 0
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: getSearchResults(
                                  state.searchResults[state.filter],
                                  context,
                                ),
                              ),
                            );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> getSearchResults(
    ProductList list,
    BuildContext context,
  ) {
    List<Widget> searchResults = [];
    for (Product p in list.products) {
      searchResults.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductFullView(
                  product: p,
                ),
              ),
            );
          },
          child: SearchBarResult(
            text: p.productName,
          ),
        ),
      );
    }
    return searchResults;
  }
}

List<Widget> searchResults = [
  SearchBarResult(
    text: "Search Result 1",
  ),
  SearchBarResult(
    text: "Search Result 2",
  ),
  SearchBarResult(
    text: "Search Result 3",
  ),
  SearchBarResult(
    text: "Search Result 4",
  ),
];

class SearchBarResult extends StatelessWidget {
  final String text;

  const SearchBarResult({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
