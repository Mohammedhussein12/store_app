import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/models/product_model.dart';

import '../../services/get_all_product_services.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    try {
      List<ProductModel> products = await AllProductsService().getAllProducts();
      emit(ProductsSuccess(products: products));
    } on Exception catch (e) {
      emit(
        ProductsFailure(errorMessage: e.toString()),
      );
    }
  }
}
