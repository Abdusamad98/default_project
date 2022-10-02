import 'package:default_project/data/models/books/book_model.dart';
import 'package:default_project/data/services/api_provider.dart';

class BooksRepository {
  BooksRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<BookModel>> getAllBooks() => apiProvider.getAllBooks();

  Future<BookModel> getBookById({required int id}) =>
      apiProvider.getBookById(id: id);

  Future<BookModel> addBook({required BookModel bookModel}) =>
      apiProvider.addBook(bookModel: bookModel);

  Future<bool> deleteBookById({required int id}) =>
      apiProvider.deleteBookById(id: id);

  Future<BookModel> updatePatch({
    required String title,
    required int publishYear,
    required int numberOfPages,
    required int price,
    required int id,
  }) =>
      apiProvider.updatePatch(
        title: title,
        publishYear: publishYear,
        numberOfPages: numberOfPages,
        price: price,
        id: id,
      );
}
