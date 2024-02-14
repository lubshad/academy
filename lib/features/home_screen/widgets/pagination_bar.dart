import 'package:academy/features/home_screen/product_listing_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../exporter.dart';

class PaginationBar extends StatelessWidget {
  const PaginationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListingController>(
      builder: (BuildContext context, ProductListingController value,
          Widget? child) {
        return Container(
          padding: const EdgeInsets.only(
            bottom: paddingLarge,
            top: padding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: value.isFirstPage ? null : value.previousPage,
                icon: const Icon(
                  Icons.chevron_left,
                ),
              ),
              ...List.generate(
                value.totalPages,
                (index) => PaginationBarItem(
                  pageNumber: index + 1,
                  currentPage: value.currentPage + 1,
                ),
              ),
              IconButton(
                onPressed: value.isLastPage ? null : value.nextPage,
                icon: const Icon(
                  Icons.chevron_right,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PaginationBarItem extends StatelessWidget {
  const PaginationBarItem({
    super.key,
    required this.pageNumber,
    required this.currentPage,
  });

  final int pageNumber;
  final int currentPage;

  bool get selected => currentPage == pageNumber;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListingController>(
      builder: (BuildContext context, ProductListingController value,
          Widget? child) {
        return InkWell(
          onTap: () => value.changePage(pageNumber - 1),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: paddingSmall),
            height: paddingXL,
            width: paddingXL,
            decoration: BoxDecoration(
              color: !selected ? null : primaryColor,
              borderRadius: BorderRadius.circular(padding),
              border: !selected ? Border.all() : null,
            ),
            alignment: Alignment.center,
            child: Expanded(
              child: Text(
                pageNumber.toString(),
                style: context.bodySmall.copyWith(
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
