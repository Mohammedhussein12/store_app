part of 'update_product_cubit.dart';

@immutable
abstract class UpdateProductState {}

class UpdateProductInitial extends UpdateProductState {}
class UpdateProductLoading extends UpdateProductState {}
class UpdateProductSuccess extends UpdateProductState {}
class UpdateProductFailure extends UpdateProductState {
  final String errorMessage;

  UpdateProductFailure({required this.errorMessage});
}

