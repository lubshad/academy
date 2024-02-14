import 'package:academy/constants.dart';
import 'package:academy/features/home_screen/product_listing_controller.dart';
import 'package:academy/theme/theme.dart';
import 'package:academy/widgets/app_logo.dart';
import 'package:academy/widgets/error_widget_with_retry.dart';
import 'package:academy/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../profile_screen/profile_screen.dart';
import 'widgets/pagination_bar.dart';
import 'widgets/product_list_item.dart';

class HomeScreen extends StatelessWidget {
  static const String path = "/home";

  const HomeScreen({super.key});

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
            Text("Academy"),
          ],
        ),
      ),
      drawer: const ProfileScreen(),
      body: ChangeNotifierProvider<ProductListingController>(
        create: (BuildContext context) => ProductListingController(),
        child: Consumer<ProductListingController>(
          builder: (BuildContext context, controller, Widget? child) {
            return NetworkResource(
              controller.future,
              error: (exception) => ErrorWidgetWithRetry(
                  exception: exception, retry: controller.fetchProducts()),
              success: (products) {
                return Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(paddingLarge)
                                .copyWith(right: 0),
                            child: Text(
                              "Showing ${controller.products.length} Courses",
                              style: context.bodyLarge,
                            ))),
                    Expanded(
                        child: ListView.separated(
                      padding: const EdgeInsets.all(
                        paddingLarge,
                      ).copyWith(top: 0),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductListItem(
                          product: controller.pagedProducts[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          gapLarge,
                      itemCount: controller.pagedProducts.length,
                    )),
                    const PaginationBar(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
