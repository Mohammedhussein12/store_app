import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cubits/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:store_app/models/product_model.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Fetch products only when the widget is first built.
    BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartPlus),
          ),
        ],
        elevation: 0,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 90),
        child: BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
          builder: (context, state) {
            if (state is ProductsSuccess) {
              List<ProductModel> products = state.products;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    CustomCard(product: products[index]),
              );
            } else if (state is ProductsFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
