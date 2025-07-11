// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartproductListHash() => r'45b40f4c9e3cf859247a620644e7d5442d6357f8';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CartproductListRef = FutureProviderRef<List<CartModel>>;
String _$cartStateHash() => r'55cbccaa2d54b2bf5c63a01267e72ef2f4e2b035';

/// See also [CartState].
@ProviderFor(CartState)
final cartStateProvider =
    AsyncNotifierProvider<CartState, List<ProductModel>>.internal(
      CartState.new,
      name: r'cartStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cartStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CartState = AsyncNotifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
