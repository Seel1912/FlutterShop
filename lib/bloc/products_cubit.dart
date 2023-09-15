import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product.dart';
import '../services/product_services.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit()
      : super(const ProductsState(
            loading: true, products: [], selectedProducts: []));
  final ProductServices _productServices = ProductServices();
  Future getProducts() async {
    try {
      List<Product> items = await _productServices.getProductsFromApi();
      emit(state.copyWith(loading: false, products: items));
    } catch (_) {}
  }

  void selectProduct(Product product) {
    bool isExisted = state.selectedProducts?.contains(product) ?? false;
    if (isExisted) {
      emit(state.copyWith(
          selectedProducts:
              state.selectedProducts?.where((e) => e != product).toList()));
    } else {
      emit(state
          .copyWith(selectedProducts: [...?state.selectedProducts, product]));
    }
  }
}
