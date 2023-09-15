import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:product_app/screens/product_detail.dart';

import '../models/product.dart';
import '../resources/app_color.dart';
import 'image_item.dart';

mixin ProductItemMixin {
  final double heightPrice = 20;
  final double paddingImage = 8;
  final double ratingSize = 15.0;
  final double space = 10;
  final double heightTitle = 40;
}

class ProductItem extends StatelessWidget with ProductItemMixin {
  final double paddingContent;
  final Product product;
  final double imageSize;
  final bool selected;

  ProductItem({
    required this.paddingContent,
    required this.product,
    required this.imageSize,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        //height: heightItem,
        padding: EdgeInsets.all(paddingContent),
        decoration: BoxDecoration(
          color: AppColor.neutralWhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageItem(
                  imageUrl: product.imageUrl ?? '',
                  marginContent: space,
                  paddingImage: paddingImage,
                  imageSize: imageSize,
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      selected ? Icons.circle : Icons.circle_outlined,
                      color: Colors.red,
                    ))
              ],
            ),
            SizedBox(height: space),
            SizedBox(
              height: heightTitle,
              child: Text(
                product.title ?? 'No Title',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: space),
            RatingBar.builder(
              initialRating: product.rating?.rate ?? 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: ratingSize,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xFFFCF500),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(height: space),
            SizedBox(
              height: heightPrice,
              child: Text(
                '\$ ${product.price}',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
