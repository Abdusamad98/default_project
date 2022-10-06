import 'package:bloc/bloc.dart';
import 'package:default_project/data/models/books/book_model.dart';
import 'package:default_project/data/models/helper/helper_model.dart';
import 'package:default_project/data/repositories/books_repository.dart';
import 'package:default_project/data/repositories/publishers_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'publishers_state.dart';

class PublishersCubit extends Cubit<PublishersState> {
  PublishersCubit({
    required this.booksRepository,
    required this.publisherRepository,
  }) : super(PublishersState(
          errorText: "",
          status: FormzStatus.pure,
          publishers: [],
          publisherBooks: [],
        ));

  final BooksRepository booksRepository;
  final PublisherRepository publisherRepository;

  void getAllPublishers() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      List<HelperModel> publishers = await []; //get
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          publishers: publishers,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
            status: FormzStatus.submissionFailure, errorText: "Error"),
      );
    }
  }

  void getPublisherBooks(int publisherId) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      List<BookModel> books = await []; //get
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          publisherBooks: books,
        ),
      );
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: "Error"));
    }
  }
}
