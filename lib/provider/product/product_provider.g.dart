// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'8362745eeb916e28d1e6c50fdccbd6ac83390a0d';

/// See also [getProducts].
@ProviderFor(getProducts)
final getProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  getProducts,
  name: r'getProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productsStateHash() => r'461a31dee4d60a0b2a28ec21101830431baebac3';

/// See also [ProductsState].
@ProviderFor(ProductsState)
final productsStateProvider =
    AutoDisposeAsyncNotifierProvider<ProductsState, void>.internal(
      ProductsState.new,
      name: r'productsStateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$productsStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductsState = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
