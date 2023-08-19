// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      fullName: json['fullName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      status: json['status'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      role: json['role'] as String? ?? '',
      website: json['website'] as String? ?? '',
      wishlist: (json['wishlist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cartlist: (json['cartlist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'userId': instance.userId,
      'verified': instance.verified,
      'image': instance.image,
      'rating': instance.rating,
      'locale': instance.locale,
      'role': instance.role,
      'website': instance.website,
      'wishlist': instance.wishlist,
      'cartlist': instance.cartlist,
    };
