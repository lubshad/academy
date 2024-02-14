import 'package:academy/mixins/search_mixin.dart';
import 'package:flutter/material.dart';

import '../../core/repository.dart';
import 'models/product_model.dart';

class ProductListingController extends ChangeNotifier with SearchMixin {
  ProductListingController() {
    fetchProducts();

    // function is from mixin
    addSearchListener(() {

      // only searching if lenght greater than 3
      if (searchController.text.isNotEmpty &&
          searchController.text.length < 3) {
        return;
      }
      currentPage = 0;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    removeSearchListener();
  }

  int get totalPages {
    return searchResult.length % 5 == 0
        ? searchResult.length ~/ 5
        : ((searchResult.length ~/ 5) + 1);
  }

  int itemPerPage = 5;

  Future<List<Product>>? future;

  List<Product> products = [];

  List<Product> get searchResult => searchController.text.isEmpty
      ? products
      : products
          .where((element) => (element.title ?? "")
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();

  fetchProducts() {
    future = DataRepository.i.fetchProducts().then((value) {
      products = value;
      return value;
    });
    notifyListeners();
  }

  List<Product> get pagedProducts {
    int start = currentPage * itemPerPage;
    int end = start + itemPerPage;
    if (end > searchResult.length) {
      end = searchResult.length;
    }
    return searchResult.sublist(start, end);
  }

  int currentPage = 0;

  void previousPage() {
    if (currentPage == 0) return;
    currentPage -= 1;
    notifyListeners();
  }

  bool get isLastPage => currentPage == (totalPages - 1);

  bool get isFirstPage => currentPage == 0;

  void nextPage() {
    if (isLastPage) return;
    currentPage += 1;
    notifyListeners();
  }

  changePage(int i) {
    currentPage = i;
    notifyListeners();
  }
}
