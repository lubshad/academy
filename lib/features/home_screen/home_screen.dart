import 'package:academy/constants.dart';
import 'package:academy/core/repository.dart';
import 'package:academy/features/home_screen/models/product_model.dart';
import 'package:academy/theme/theme.dart';
import 'package:academy/widgets/app_logo.dart';
import 'package:academy/widgets/error_widget_with_retry.dart';
import 'package:academy/widgets/network_resource.dart';
import 'package:flutter/material.dart';

import '../profile_screen/profile_screen.dart';
import 'widgets/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  static const String path = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Product>>? future;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() {
    setState(() {
      future = DataRepository.i.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          SizedBox(
            width: paddingXXL,
          )
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(
              size: paddingXL,
            ),
            gap,
            Text("academy"),
          ],
        ),
      ),
      drawer: const ProfileScreen(),
      body: NetworkResource(
        future,
        error: (exception) =>
            ErrorWidgetWithRetry(exception: exception, retry: fetchProducts),
        success: (products) {
          return Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.all(paddingLarge)
                          .copyWith(right: 0, bottom: 0),
                      child: Text(
                        "Showing ${products.length} Courses",
                        style: context.bodyLarge,
                      ))),
              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.all(
                  paddingLarge,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductListItem(
                    product: products[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => gapLarge,
                itemCount: products.length,
              )),
              const SafeArea(
                child: Placeholder(
                  fallbackHeight: paddingXL,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
