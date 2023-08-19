// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wishListProductsHash() => r'21e771c5150e6e2fc806278902da16edbef2494f';

/// See also [wishListProducts].
@ProviderFor(wishListProducts)
final wishListProductsProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
  wishListProducts,
  name: r'wishListProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wishListProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WishListProductsRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
String _$wishStateHash() => r'8ff3e43dcf22573322666e59e2a3dc6c229cf8a9';

/// See also [WishState].
@ProviderFor(WishState)
final wishStateProvider =
    NotifierProvider<WishState, List<ProductModel>>.internal(
  WishState.new,
  name: r'wishStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$wishStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WishState = Notifier<List<ProductModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
