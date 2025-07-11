// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wishListproductListHash() =>
    r'7ddad61931bde3c25526389718858ebfe1f80211';

/// See also [wishListproductList].
@ProviderFor(wishListproductList)
final wishListproductListProvider = FutureProvider<List<ProductModel>>.internal(
  wishListproductList,
  name: r'wishListproductListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wishListproductListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WishListproductListRef = FutureProviderRef<List<ProductModel>>;
String _$wishStateHash() => r'310c1c04df5f6b5ba4cbd86f338e478d1d2fdbf9';

/// See also [WishState].
@ProviderFor(WishState)
final wishStateProvider =
    NotifierProvider<WishState, List<ProductModel>>.internal(
      WishState.new,
      name: r'wishStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$wishStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WishState = Notifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
