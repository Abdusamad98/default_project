import 'package:bloc/bloc.dart';
import 'package:default_project/data/models/product_item.dart';
import 'package:default_project/data/models/state/my_enum_state.dart';
import 'package:default_project/data/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsRepository})
      : super(ProductsState(
          myEnumState: MyEnumState.PURE,
          products: [],
          errorText: "",
          isNewProductAdded: false,
        ));

  final ProductsRepository productsRepository;

  void fetchProducts() async {
    emit(state.copyWith(
      myEnumState: MyEnumState.LOADING,
      isNewProductAdded: false,
    ));
    try {
      var products = await productsRepository.getAllProducts();
      emit(
        state.copyWith(
          myEnumState: MyEnumState.SUCCESS,
          products: products,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          myEnumState: MyEnumState.ERROR,
          errorText: error.toString(),
        ),
      );
    }
  }

  void addProduct({
    required String name,
    required int id,
  }) async {
    emit(state.copyWith(
      myEnumState: MyEnumState.LOADING,
    ));
    try {
      var isAdded = await productsRepository.addProduct(
        productName: name,
        productId: id,
      );
      emit(
        state.copyWith(
          myEnumState: MyEnumState.SUCCESS,
          isNewProductAdded: isAdded,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          myEnumState: MyEnumState.ERROR,
          errorText: error.toString(),
        ),
      );
    }
  }
}
