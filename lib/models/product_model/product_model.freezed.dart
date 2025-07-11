// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get status => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get productTitle => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get discount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  bool get isFav => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  bool get inCart => throw _privateConstructorUsedError;
  @JsonKey(name: '\$createdAt', includeToJson: false)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$updatedAt', includeToJson: false)
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$id', includeToJson: false)
  String get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: '\$collectionId', includeToJson: false)
  String get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: '\$databaseId', includeToJson: false)
  String get databaseId => throw _privateConstructorUsedError;
  @JsonKey(name: '\$permissions', includeToJson: false)
  List<String> get permissions => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
    ProductModel value,
    $Res Function(ProductModel) then,
  ) = _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call({
    String status,
    String userId,
    String productTitle,
    bool verified,
    String image,
    double rating,
    String name,
    int price,
    String productId,
    int quantity,
    String discount,
    String description,
    @JsonKey(includeToJson: false) bool isFav,
    @JsonKey(includeToJson: false) bool inCart,
    @JsonKey(name: '\$createdAt', includeToJson: false) String createdAt,
    @JsonKey(name: '\$updatedAt', includeToJson: false) String updatedAt,
    @JsonKey(name: '\$id', includeToJson: false) String documentId,
    @JsonKey(name: '\$collectionId', includeToJson: false) String collectionId,
    @JsonKey(name: '\$databaseId', includeToJson: false) String databaseId,
    @JsonKey(name: '\$permissions', includeToJson: false)
    List<String> permissions,
  });
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userId = null,
    Object? productTitle = null,
    Object? verified = null,
    Object? image = null,
    Object? rating = null,
    Object? name = null,
    Object? price = null,
    Object? productId = null,
    Object? quantity = null,
    Object? discount = null,
    Object? description = null,
    Object? isFav = null,
    Object? inCart = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? documentId = null,
    Object? collectionId = null,
    Object? databaseId = null,
    Object? permissions = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            productTitle: null == productTitle
                ? _value.productTitle
                : productTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int,
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            isFav: null == isFav
                ? _value.isFav
                : isFav // ignore: cast_nullable_to_non_nullable
                      as bool,
            inCart: null == inCart
                ? _value.inCart
                : inCart // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            documentId: null == documentId
                ? _value.documentId
                : documentId // ignore: cast_nullable_to_non_nullable
                      as String,
            collectionId: null == collectionId
                ? _value.collectionId
                : collectionId // ignore: cast_nullable_to_non_nullable
                      as String,
            databaseId: null == databaseId
                ? _value.databaseId
                : databaseId // ignore: cast_nullable_to_non_nullable
                      as String,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
    _$ProductModelImpl value,
    $Res Function(_$ProductModelImpl) then,
  ) = __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String status,
    String userId,
    String productTitle,
    bool verified,
    String image,
    double rating,
    String name,
    int price,
    String productId,
    int quantity,
    String discount,
    String description,
    @JsonKey(includeToJson: false) bool isFav,
    @JsonKey(includeToJson: false) bool inCart,
    @JsonKey(name: '\$createdAt', includeToJson: false) String createdAt,
    @JsonKey(name: '\$updatedAt', includeToJson: false) String updatedAt,
    @JsonKey(name: '\$id', includeToJson: false) String documentId,
    @JsonKey(name: '\$collectionId', includeToJson: false) String collectionId,
    @JsonKey(name: '\$databaseId', includeToJson: false) String databaseId,
    @JsonKey(name: '\$permissions', includeToJson: false)
    List<String> permissions,
  });
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
    _$ProductModelImpl _value,
    $Res Function(_$ProductModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userId = null,
    Object? productTitle = null,
    Object? verified = null,
    Object? image = null,
    Object? rating = null,
    Object? name = null,
    Object? price = null,
    Object? productId = null,
    Object? quantity = null,
    Object? discount = null,
    Object? description = null,
    Object? isFav = null,
    Object? inCart = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? documentId = null,
    Object? collectionId = null,
    Object? databaseId = null,
    Object? permissions = null,
  }) {
    return _then(
      _$ProductModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        productTitle: null == productTitle
            ? _value.productTitle
            : productTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int,
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        isFav: null == isFav
            ? _value.isFav
            : isFav // ignore: cast_nullable_to_non_nullable
                  as bool,
        inCart: null == inCart
            ? _value.inCart
            : inCart // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        documentId: null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                  as String,
        collectionId: null == collectionId
            ? _value.collectionId
            : collectionId // ignore: cast_nullable_to_non_nullable
                  as String,
        databaseId: null == databaseId
            ? _value.databaseId
            : databaseId // ignore: cast_nullable_to_non_nullable
                  as String,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl({
    this.status = '',
    this.userId = '',
    this.productTitle = '',
    this.verified = false,
    this.image = '',
    this.rating = 5.0,
    this.name = '',
    this.price = 0,
    this.productId = '',
    this.quantity = 0,
    this.discount = '',
    this.description = '',
    @JsonKey(includeToJson: false) this.isFav = false,
    @JsonKey(includeToJson: false) this.inCart = false,
    @JsonKey(name: '\$createdAt', includeToJson: false) this.createdAt = '',
    @JsonKey(name: '\$updatedAt', includeToJson: false) this.updatedAt = '',
    @JsonKey(name: '\$id', includeToJson: false) this.documentId = '',
    @JsonKey(name: '\$collectionId', includeToJson: false)
    this.collectionId = '',
    @JsonKey(name: '\$databaseId', includeToJson: false) this.databaseId = '',
    @JsonKey(name: '\$permissions', includeToJson: false)
    final List<String> permissions = const [],
  }) : _permissions = permissions;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String productTitle;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String productId;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final String discount;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(includeToJson: false)
  final bool isFav;
  @override
  @JsonKey(includeToJson: false)
  final bool inCart;
  @override
  @JsonKey(name: '\$createdAt', includeToJson: false)
  final String createdAt;
  @override
  @JsonKey(name: '\$updatedAt', includeToJson: false)
  final String updatedAt;
  @override
  @JsonKey(name: '\$id', includeToJson: false)
  final String documentId;
  @override
  @JsonKey(name: '\$collectionId', includeToJson: false)
  final String collectionId;
  @override
  @JsonKey(name: '\$databaseId', includeToJson: false)
  final String databaseId;
  final List<String> _permissions;
  @override
  @JsonKey(name: '\$permissions', includeToJson: false)
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'ProductModel(status: $status, userId: $userId, productTitle: $productTitle, verified: $verified, image: $image, rating: $rating, name: $name, price: $price, productId: $productId, quantity: $quantity, discount: $discount, description: $description, isFav: $isFav, inCart: $inCart, createdAt: $createdAt, updatedAt: $updatedAt, documentId: $documentId, collectionId: $collectionId, databaseId: $databaseId, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productTitle, productTitle) ||
                other.productTitle == productTitle) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isFav, isFav) || other.isFav == isFav) &&
            (identical(other.inCart, inCart) || other.inCart == inCart) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.databaseId, databaseId) ||
                other.databaseId == databaseId) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    status,
    userId,
    productTitle,
    verified,
    image,
    rating,
    name,
    price,
    productId,
    quantity,
    discount,
    description,
    isFav,
    inCart,
    createdAt,
    updatedAt,
    documentId,
    collectionId,
    databaseId,
    const DeepCollectionEquality().hash(_permissions),
  ]);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel({
    final String status,
    final String userId,
    final String productTitle,
    final bool verified,
    final String image,
    final double rating,
    final String name,
    final int price,
    final String productId,
    final int quantity,
    final String discount,
    final String description,
    @JsonKey(includeToJson: false) final bool isFav,
    @JsonKey(includeToJson: false) final bool inCart,
    @JsonKey(name: '\$createdAt', includeToJson: false) final String createdAt,
    @JsonKey(name: '\$updatedAt', includeToJson: false) final String updatedAt,
    @JsonKey(name: '\$id', includeToJson: false) final String documentId,
    @JsonKey(name: '\$collectionId', includeToJson: false)
    final String collectionId,
    @JsonKey(name: '\$databaseId', includeToJson: false)
    final String databaseId,
    @JsonKey(name: '\$permissions', includeToJson: false)
    final List<String> permissions,
  }) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get status;
  @override
  String get userId;
  @override
  String get productTitle;
  @override
  bool get verified;
  @override
  String get image;
  @override
  double get rating;
  @override
  String get name;
  @override
  int get price;
  @override
  String get productId;
  @override
  int get quantity;
  @override
  String get discount;
  @override
  String get description;
  @override
  @JsonKey(includeToJson: false)
  bool get isFav;
  @override
  @JsonKey(includeToJson: false)
  bool get inCart;
  @override
  @JsonKey(name: '\$createdAt', includeToJson: false)
  String get createdAt;
  @override
  @JsonKey(name: '\$updatedAt', includeToJson: false)
  String get updatedAt;
  @override
  @JsonKey(name: '\$id', includeToJson: false)
  String get documentId;
  @override
  @JsonKey(name: '\$collectionId', includeToJson: false)
  String get collectionId;
  @override
  @JsonKey(name: '\$databaseId', includeToJson: false)
  String get databaseId;
  @override
  @JsonKey(name: '\$permissions', includeToJson: false)
  List<String> get permissions;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
