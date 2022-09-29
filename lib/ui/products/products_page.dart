import 'package:default_project/cubits/products/products_cubit.dart';
import 'package:default_project/data/models/state/my_enum_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Column(
        children: [
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state.myEnumState == MyEnumState.SUCCESS) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.products.length, (index) {
                      var product = state.products[index];
                      return ListTile(
                        title: Text(
                          product.attributeItem.name,
                        ),
                        subtitle: Text(
                          product.attributeItem.productId.toString(),
                        ),
                      );
                    }),
                  ),
                );
              } else if (state.myEnumState == MyEnumState.LOADING) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.myEnumState == MyEnumState.ERROR) {
                return Center(
                  child: Text(state.errorText),
                );
              } else if (state.myEnumState == MyEnumState.PURE) {
                return const Center(
                  child: Text("Hali data jo'q!"),
                );
              }
              return const SizedBox();
            },
          ),
          Text(
              "IsNewAdded:${context.watch<ProductsCubit>().state.isNewProductAdded}"),
          BlocListener<ProductsCubit, ProductsState>(
            listenWhen: (oldState, currentState) {
              return oldState.myEnumState == currentState.myEnumState;
            },
            listener: (context, state) {
              if (state.isNewProductAdded) {
                BlocProvider.of<ProductsCubit>(context).fetchProducts();
              }
            },
            child: SizedBox(),
          ),
          TextButton(
            onPressed: () {
              context
                  .read<ProductsCubit>()
                  .addProduct(name: 'MacBook Pro 16 Inch', id: 12);
            },
            child: const Text("Add Product"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //context.read<ProductsCubit>().fetchProducts();
          BlocProvider.of<ProductsCubit>(context).fetchProducts();
        },
        child: const Icon(Icons.get_app),
      ),
    );
  }
}
