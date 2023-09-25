import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/update_product_cubit/update_product_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});

  static String id = 'Update Product';
  String? productName, image, desc, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocProvider(
      create: (context) => UpdateProductCubit(),
      child: Builder(builder: (context) {
        return BlocConsumer<UpdateProductCubit, UpdateProductState>(
          listener: (context, state) {
            if (state is UpdateProductSuccess) {
              isLoading = false;
            } else if (state is UpdateProductSuccess) {
              isLoading = false;
            } else {
              isLoading = true;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: const Text(
                    'Update Product',
                    style: TextStyle(color: Colors.black),
                  ),
                  elevation: 0,
                  centerTitle: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Product Name',
                          onChanged: (data) {
                            productName = data;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'description',
                          onChanged: (data) {
                            desc = data;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          inputType: TextInputType.number,
                          hintText: 'price',
                          onChanged: (data) {
                            price = data;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'image',
                          onChanged: (data) {
                            image = data;
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButton(
                          text: 'Update',
                          onTap: () async {
                            try {
                              BlocProvider.of<UpdateProductCubit>(context)
                                  .updateProduct(product, productName!, image!,
                                      desc!, price!);
                              print('success');
                            } on Exception catch (e) {
                              print(e.toString());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
