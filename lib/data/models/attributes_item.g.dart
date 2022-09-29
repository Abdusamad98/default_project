// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeItem _$AttributeItemFromJson(Map<String, dynamic> json) =>
    AttributeItem(
      name: json['name'] as String? ?? '',
      productId: json['product_id'] as int? ?? 0,
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$AttributeItemToJson(AttributeItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'product_id': instance.productId,
      'createdAt': instance.createdAt,
    };
