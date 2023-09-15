import '../models/product.dart';

class ProductsState {
  const ProductsState({this.loading, this.products, this.selectedProducts});

  final bool? loading;
  final List<Product>? products;
  final List<Product>? selectedProducts;

  ProductsState copyWith(
          {bool? loading,
          List<Product>? products,
          List<Product>? selectedProducts}) =>
      ProductsState(
          loading: loading ?? this.loading,
          products: products ?? this.products,
          selectedProducts: selectedProducts ?? this.selectedProducts);
}
