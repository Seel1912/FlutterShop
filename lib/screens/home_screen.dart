import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/bloc/products_state.dart';
import 'package:product_app/widgets/product_item.dart';

import '../bloc/products_cubit.dart';
import '../generated/l10n.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget with ProductItemMixin {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //step 2
    const int crossAxisCount = 2;
    const double paddingContent = 10;

    double widthScreen = MediaQuery.of(context).size.width;
    double widthItem =
        (widthScreen - (crossAxisCount + 1) * space) / crossAxisCount;
    double imageSize = widthItem - 2 * (paddingContent * 2);

    double heightItem = paddingContent +
        imageSize +
        space +
        heightTitle +
        space +
        ratingSize +
        space +
        heightPrice +
        paddingContent;

    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).products,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: state.loading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                padding: EdgeInsets.all(space),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: space,
                  mainAxisSpacing: space,
                  childAspectRatio: widthItem / heightItem,
                ),
                itemBuilder: (context, index) {
                  final product = state.products?[index];
                  return ProductItem(
                      imageSize: imageSize,
                      paddingContent: paddingContent,
                      product: product ?? const Product(),
                      selected:
                          state.selectedProducts?.contains(product) ?? false);
                },
                itemCount: state.products?.length ?? 0,
              ),
      );
    });
  }
}
