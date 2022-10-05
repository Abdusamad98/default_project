import 'package:bloc/bloc.dart';
import 'package:default_project/data/repositories/books_repository.dart';
import 'package:default_project/data/repositories/publishers_repository.dart';
import 'package:meta/meta.dart';

part 'publishers_state.dart';

class PublishersCubit extends Cubit<PublishersState> {
  PublishersCubit({
    required this.booksRepository,
    required this.publisherRepository,
  }) : super(PublishersInitial());

  final BooksRepository booksRepository;
  final PublisherRepository publisherRepository;
}
