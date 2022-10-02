import 'package:bloc/bloc.dart';
import 'package:default_project/data/models/books/book_model.dart';
import 'package:default_project/data/repositories/books_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit({
    required this.booksRepository,
  }) : super(BooksState(
          books: [],
          formzStatus: FormzStatus.pure,
          errorText: "",
        ));

  final BooksRepository booksRepository;

  void getAllBooks() async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var books = await booksRepository.getAllBooks();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          books: books,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "getAllBooksError",
        ),
      );
    }
  }

  void deleteBookById(int id) async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var isRemoved = await booksRepository.deleteBookById(id: id);
      if (isRemoved) {
        getAllBooks();
      }
    } catch (error) {
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "deleteBookError",
        ),
      );
    }
  }

  void addBook(BookModel bookModel) async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var fullBook = await booksRepository.addBook(bookModel: bookModel);
      if (fullBook.id > 0) {
        getAllBooks();
      }
    } catch (error) {
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "addBookError",
        ),
      );
    }
  }
}
