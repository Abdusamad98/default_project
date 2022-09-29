import 'package:json_annotation/json_annotation.dart';

part 'attributes_item.g.dart';

@JsonSerializable(explicitToJson: true)
class AttributeItem {

  @JsonKey(defaultValue: "", name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'product_id')
  int productId;

  @JsonKey(defaultValue: "", name: 'createdAt')
  String createdAt;

  AttributeItem({
    required this.name,
    required this.productId,
    required this.createdAt,
  });

  factory AttributeItem.fromJson(Map<String, dynamic> json) =>
      _$AttributeItemFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeItemToJson(this);
}
