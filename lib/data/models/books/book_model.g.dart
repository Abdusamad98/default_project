// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      genre: json['genre'] as int? ?? 0,
      isbn: json['isbn'] as String? ?? '',
      language: json['language'] as int? ?? 0,
      numberOfPages: json['numberOfPages'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      publisherId: json['publisherId'] as int? ?? 0,
      publishYear: json['publishYear'] as int? ?? 0,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'title': instance.title,
      'publishYear': instance.publishYear,
      'numberOfPages': instance.numberOfPages,
      'publisherId': instance.publisherId,
      'isbn': instance.isbn,
      'price': instance.price,
      'id': instance.id,
      'language': instance.language,
      'genre': instance.genre,
    };
