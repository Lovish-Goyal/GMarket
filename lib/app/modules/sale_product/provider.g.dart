// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListHash() => r'c149b91e5b87096f8e5421dea7d80a4abd344359';

/// See also [productList].
@ProviderFor(productList)
final productListProvider = FutureProvider<List<ProductModel>>.internal(
  productList,
  name: r'productListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductListRef = FutureProviderRef<List<ProductModel>>;
String _$productHash() => r'f3566e7484e5dacc22f09663837a018e3de0fe96';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ProductRef = AutoDisposeFutureProviderRef<ProductModel?>;

/// See also [product].
@ProviderFor(product)
const productProvider = ProductFamily();

/// See also [product].
class ProductFamily extends Family<AsyncValue<ProductModel?>> {
  /// See also [product].
  const ProductFamily();

  /// See also [product].
  ProductProvider call(
    String documentId,
  ) {
    return ProductProvider(
      documentId,
    );
  }

  @override
  ProductProvider getProviderOverride(
    covariant ProductProvider provider,
  ) {
    return call(
      provider.documentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productProvider';
}

/// See also [product].
class ProductProvider extends AutoDisposeFutureProvider<ProductModel?> {
  /// See also [product].
  ProductProvider(
    this.documentId,
  ) : super.internal(
          (ref) => product(
            ref,
            documentId,
          ),
          from: productProvider,
          name: r'productProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productHash,
          dependencies: ProductFamily._dependencies,
          allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
        );

  final String documentId;

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$productSearchHash() => r'1cf1d69d78d7b48d0bb902e6f6e38db5fd884bce';
typedef ProductSearchRef = AutoDisposeFutureProviderRef<List<ProductModel>?>;

/// See also [productSearch].
@ProviderFor(productSearch)
const productSearchProvider = ProductSearchFamily();

/// See also [productSearch].
class ProductSearchFamily extends Family<AsyncValue<List<ProductModel>?>> {
  /// See also [productSearch].
  const ProductSearchFamily();

  /// See also [productSearch].
  ProductSearchProvider call(
    String query,
  ) {
    return ProductSearchProvider(
      query,
    );
  }

  @override
  ProductSearchProvider getProviderOverride(
    covariant ProductSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productSearchProvider';
}

/// See also [productSearch].
class ProductSearchProvider
    extends AutoDisposeFutureProvider<List<ProductModel>?> {
  /// See also [productSearch].
  ProductSearchProvider(
    this.query,
  ) : super.internal(
          (ref) => productSearch(
            ref,
            query,
          ),
          from: productSearchProvider,
          name: r'productSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productSearchHash,
          dependencies: ProductSearchFamily._dependencies,
          allTransitiveDependencies:
              ProductSearchFamily._allTransitiveDependencies,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is ProductSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$productStateHash() => r'd2568668d22798b9b065bf9a4eac1b679dbe2eec';

/// See also [ProductState].
@ProviderFor(ProductState)
final productStateProvider =
    NotifierProvider<ProductState, List<ProductModel>>.internal(
  ProductState.new,
  name: r'productStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductState = Notifier<List<ProductModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
