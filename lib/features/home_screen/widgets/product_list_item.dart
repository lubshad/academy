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
        padding: const EdgeInsets.all(padding),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  paddingLarge,
                ),
                child: CachedNetworkImage(
                  imageUrl: product.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            gapLarge,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    product.category ?? "",
                    style: context.bodyMedium.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  gap,
                  Row(
                    children: [
                      RatingBar(
                        initialRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: paddingLarge,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: starColor),
                          half: const Icon(
                            Icons.star_half,
                            color: starColor,
                          ),
                          empty: const Icon(
                            Icons.star_border,
                            color: starColor,
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          logInfo(rating);
                        },
                      ),
                      Text(
                        "(${product.rating?.rate ?? 0}) (${product.rating?.count ?? 0})",
                        style: context.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
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
