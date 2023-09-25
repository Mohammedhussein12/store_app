import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/product_model.dart';
import '../../services/update_product.dart';
part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitial());

  Future<void> updateProduct(ProductModel product, String productName,
      String image, String desc, String price) async {
    emit(UpdateProductLoading());
    try {
      await UpdateProductService().updateProduct(
          title: productName == null ? product.title : productName!,
          price: price == null ? product.price.toString() : price!,
          desc: desc == null ? product.description : desc!,
          image: image == null ? product.image : image!,
          category: product.category,
          id: product.id);
      emit(UpdateProductSuccess());
    } on Exception catch (e) {
      emit(
        UpdateProductFailure(errorMessage: e.toString()),
      );
    }
  }
}
