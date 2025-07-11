import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @Default('') String name,
    @Default('') String image,
    @Default('') String rating,
    @Default(0) int price,
    @Default('') String discount,
    @Default(0) int quantity,
    @Default('') String productId,
    @Default('') String description,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
