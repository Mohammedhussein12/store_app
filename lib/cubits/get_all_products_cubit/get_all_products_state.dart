part of 'get_all_products_cubit.dart';

@immutable
abstract class GetAllProductsState {}

class GetAllProductsInitial extends GetAllProductsState {}

class ProductsLoading extends GetAllProductsState {}

class ProductsSuccess extends GetAllProductsState {
  final List<ProductModel> products;

  ProductsSuccess({required this.products});
}

class ProductsFailure extends GetAllProductsState {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}
