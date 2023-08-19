// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartModel _$$_CartModelFromJson(Map<String, dynamic> json) => _$_CartModel(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      discount: json['discount'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      productId: json['productId'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_CartModelToJson(_$_CartModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'rating': instance.rating,
      'price': instance.price,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'description': instance.description,
    };
