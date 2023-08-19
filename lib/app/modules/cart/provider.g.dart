// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartproductListHash() => r'1f14c9f97def67a26a6ce463bb8e087b24b0cd2d';

/// See also [cartproductList].
@ProviderFor(cartproductList)
final cartproductListProvider = FutureProvider<List<CartModel>>.internal(
  cartproductList,
  name: r'cartproductListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartproductListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartproductListRef = FutureProviderRef<List<CartModel>>;
String _$cartStateHash() => r'bdfc1791718f235a3e756eca5a7983b117b665ae';

/// See also [CartState].
@ProviderFor(CartState)
final cartStateProvider =
    NotifierProvider<CartState, List<ProductModel>>.internal(
  CartState.new,
  name: r'cartStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartState = Notifier<List<ProductModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
