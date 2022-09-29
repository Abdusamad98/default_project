part of 'products_cubit.dart';

class ProductsState extends Equatable {
  ProductsState({
    required this.myEnumState,
    required this.products,
    required this.errorText,
    required this.isNewProductAdded,
  });

  final List<ProductItem> products;
  final MyEnumState myEnumState;
  final String errorText;
  final bool isNewProductAdded;

  ProductsState copyWith({
    List<ProductItem>? products,
    MyEnumState? myEnumState,
    String? errorText,
    bool? isNewProductAdded,
  }) =>
      ProductsState(
        products: products ?? this.products,
        myEnumState: myEnumState ?? this.myEnumState,
        errorText: errorText ?? this.errorText,
        isNewProductAdded: isNewProductAdded ?? this.isNewProductAdded,
      );

  @override
  List<Object> get props => [
        products,
        myEnumState,
        errorText,
        isNewProductAdded,
      ];
}
