// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      status: json['status'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      productTitle: json['productTitle'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      productId: json['productId'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      discount: json['discount'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isFav: json['isFav'] as bool? ?? false,
      inCart: json['inCart'] as bool? ?? false,
      createdAt: json[r'$createdAt'] as String? ?? '',
      updatedAt: json[r'$updatedAt'] as String? ?? '',
      documentId: json[r'$id'] as String? ?? '',
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      permissions: (json[r'$permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'userId': instance.userId,
      'productTitle': instance.productTitle,
      'verified': instance.verified,
      'image': instance.image,
      'rating': instance.rating,
      'name': instance.name,
      'price': instance.price,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'description': instance.description,
    };
