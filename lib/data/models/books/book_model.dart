import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: 0, name: "publishYear")
  int publishYear;

  @JsonKey(defaultValue: 0, name: "numberOfPages")
  int numberOfPages;

  @JsonKey(defaultValue: 0, name: "publisherId")
  int publisherId;

  @JsonKey(defaultValue: "", name: "isbn")
  String isbn;

  @JsonKey(defaultValue: 0, name: "price")
  int price;

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: 0, name: "language")
  int language;

  @JsonKey(defaultValue: 0, name: "genre")
  int genre;

  BookModel({
    required this.id,
    required this.title,
    required this.genre,
    required this.isbn,
    required this.language,
    required this.numberOfPages,
    required this.price,
    required this.publisherId,
    required this.publishYear,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
