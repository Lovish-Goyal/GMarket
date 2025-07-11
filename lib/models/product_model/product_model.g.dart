// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      status: json['status'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      productTitle: json['productTitle'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      productId: json['productId'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      discount: json['discount'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isFav: json['isFav'] as bool? ?? false,
      inCart: json['inCart'] as bool? ?? false,
      createdAt: json[r'$createdAt'] as String? ?? '',
      updatedAt: json[r'$updatedAt'] as String? ?? '',
      documentId: json[r'$id'] as String? ?? '',
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      permissions:
          (json[r'$permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
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
