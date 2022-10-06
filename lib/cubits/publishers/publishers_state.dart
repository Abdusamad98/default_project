part of 'publishers_cubit.dart';

class PublishersState extends Equatable {
  PublishersState({
    required this.errorText,
    required this.status,
    required this.publishers,
    required this.publisherBooks,
  });

  final FormzStatus status;
  final String errorText;
  final List<HelperModel> publishers;
  final List<BookModel> publisherBooks;

  PublishersState copyWith({
    FormzStatus? status,
    List<HelperModel>? publishers,
    String? errorText,
    List<BookModel>? publisherBooks,
})=>
      PublishersState(
          errorText: errorText ?? this.errorText,
          status: status ?? this.status,
          publishers: publishers ?? this.publishers,
          publisherBooks: publisherBooks ?? this.publisherBooks);

  @override
  List<Object?> get props => [
        errorText,
        status,
        publishers,
        publisherBooks,
      ];
}
