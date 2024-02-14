import 'package:flutter/material.dart';

import '../../core/repository.dart';
import 'models/product_model.dart';

class ProductListingController extends ChangeNotifier {
  ProductListingController() {
    fetchProducts();
  }

  int get totalPages {
    return products.length % 5 == 0
        ? products.length ~/ 5
        : ((products.length ~/ 5) + 1);
  }

  int itemPerPage = 5;

  Future<List<Product>>? future;

  List<Product> products = [];

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
    return products.sublist(start, end);
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
