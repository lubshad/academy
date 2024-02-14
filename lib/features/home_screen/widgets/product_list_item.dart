import 'package:academy/features/home_screen/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../exporter.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            padding,
          ),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: product.image ?? "",
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    product.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(product.category ?? ""),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                          "(${product.rating?.rate ?? 0}) (${product.rating?.count ?? 0})"),
                      Text("$dollar${product.price}"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
