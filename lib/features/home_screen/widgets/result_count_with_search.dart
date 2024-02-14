import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../exporter.dart';
import '../product_listing_controller.dart';

class ResultCountWithSearch extends StatefulWidget {
  const ResultCountWithSearch({
    super.key,
  });

  @override
  State<ResultCountWithSearch> createState() => _ResultCountWithSearchState();
}

class _ResultCountWithSearchState extends State<ResultCountWithSearch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListingController>(
      builder: (BuildContext context, ProductListingController value,
          Widget? child) {
        return Container(
            height: paddingXXL,
            padding: const EdgeInsets.all(paddingLarge),
            child: Builder(builder: (context) {
              if (searchVisible) {
                return Expanded(
                  child: Builder(builder: (context) {
                    return TextFormField(
                      controller: value.searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.searchController.clear();
                            tougleSearchView();
                          },
                          icon: const Icon(
                            Icons.close,
                          ),
                        ),
                        hintText: "Search by name",
                      ),
                    ).animate().fade(
                          curve: Curves.fastOutSlowIn,
                          begin: 0,
                          end: 1,
                        );
                  }),
                );
              } else {
                return Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Showing ${value.products.length} Courses",
                        style: context.bodyLarge,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: tougleSearchView,
                        icon: const Icon(
                          Icons.search,
                        ),
                      )
                    ],
                  ).animate().fade(
                        curve: Curves.fastOutSlowIn,
                        begin: 0,
                        end: 1,
                      ),
                );
              }
            }));
      },
    );
  }

  bool searchVisible = false;

  void tougleSearchView() {
    setState(() {
      searchVisible = !searchVisible;
    });
  }
}
