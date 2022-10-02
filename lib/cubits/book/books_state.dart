part of 'books_cubit.dart';

class BooksState extends Equatable {
  BooksState({
    required this.books,
    required this.formzStatus,
    required this.errorText,
  });

  final List<BookModel> books;
  final FormzStatus formzStatus;
  final String errorText;

  BooksState copyWith({
    List<BookModel>? books,
    FormzStatus? formzStatus,
    String? errorText,
  }) =>
      BooksState(
        books: books ?? this.books,
        formzStatus: formzStatus ?? this.formzStatus,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [
        books,
        formzStatus,
        errorText,
      ];
}
