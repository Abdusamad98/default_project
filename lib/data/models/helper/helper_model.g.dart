// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelperModel _$HelperModelFromJson(Map<String, dynamic> json) => HelperModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$HelperModelToJson(HelperModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
