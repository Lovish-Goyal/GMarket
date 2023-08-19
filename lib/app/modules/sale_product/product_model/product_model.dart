// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default('') String status,
    @Default('') String userId,
    @Default('') String productTitle,
    @Default(false) bool verified,
    @Default('') String image,
    @Default('') String rating,
    @Default('') String name,
    @Default(0) int price,
    @Default('') String productId,
    @Default(0) int quantity,
    @Default('') String discount,
    @Default('') String description,
    @JsonKey(includeToJson: false) @Default(false) bool isFav,
     @JsonKey(includeToJson: false) @Default(false) bool inCart,
    @JsonKey(name: '\$createdAt', includeToJson: false)
    @Default('')
    String createdAt,
    @JsonKey(name: '\$updatedAt', includeToJson: false)
    @Default('')
    String updatedAt,
    @JsonKey(name: '\$id', includeToJson: false) @Default('') String documentId,
    @JsonKey(name: '\$collectionId', includeToJson: false)
    @Default('')
    String collectionId,
    @JsonKey(name: '\$databaseId', includeToJson: false)
    @Default('')
    String databaseId,
    @JsonKey(name: '\$permissions', includeToJson: false)
    @Default([])
    List<String> permissions,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
