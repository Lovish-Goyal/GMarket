// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      discount: json['discount'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      productId: json['productId'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
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
