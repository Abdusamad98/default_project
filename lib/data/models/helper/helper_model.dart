import 'package:json_annotation/json_annotation.dart';

part 'helper_model.g.dart';

@JsonSerializable()
class HelperModel {
  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  HelperModel({
    required this.id,
    required this.name,
  });

  factory HelperModel.fromJson(Map<String, dynamic> json) =>
      _$HelperModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelperModelToJson(this);
}
