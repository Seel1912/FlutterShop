import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_app/bloc/products_state.dart';

import '../bloc/products_cubit.dart';
import '../models/product.dart';
import '../widgets/image_item.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      bool isChecked = state.selectedProducts?.contains(product) ?? false;
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageItem(
                  imageUrl: product.imageUrl ?? '',
                  marginContent: 0,
                  paddingImage: 0,
                  imageSize: 400,
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        !isChecked ? Icons.circle_outlined : Icons.circle,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        context.read<ProductsCubit>().selectProduct(product);
                      },
                    ))
              ],
            ),
            SizedBox(height: 10),
            Text(
              product.title ?? 'No Title',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            RatingBar.builder(
              initialRating: product.rating?.rate ?? 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xFFFCF500),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(height: 10),
            Text(
              '\$ ${product.price}',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      );
    });
  }
}
