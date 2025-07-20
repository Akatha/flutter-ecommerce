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
String _$getProductHash() => r'95b1ce8347c3b3a9dc918f12a03cfb609951bb05';

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

/// See also [getProduct].
@ProviderFor(getProduct)
const getProductProvider = GetProductFamily();

/// See also [getProduct].
class GetProductFamily extends Family<AsyncValue<Product>> {
  /// See also [getProduct].
  const GetProductFamily();

  /// See also [getProduct].
  GetProductProvider call({
    required String id,
  }) {
    return GetProductProvider(
      id: id,
    );
  }

  @override
  GetProductProvider getProviderOverride(
    covariant GetProductProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getProductProvider';
}

/// See also [getProduct].
class GetProductProvider extends AutoDisposeFutureProvider<Product> {
  /// See also [getProduct].
  GetProductProvider({
    required String id,
  }) : this._internal(
          (ref) => getProduct(
            ref as GetProductRef,
            id: id,
          ),
          from: getProductProvider,
          name: r'getProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductHash,
          dependencies: GetProductFamily._dependencies,
          allTransitiveDependencies:
              GetProductFamily._allTransitiveDependencies,
          id: id,
        );

  GetProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Product> Function(GetProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductProvider._internal(
        (ref) => create(ref as GetProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _GetProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetProductRef on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetProductProviderElement
    extends AutoDisposeFutureProviderElement<Product> with GetProductRef {
  _GetProductProviderElement(super.provider);

  @override
  String get id => (origin as GetProductProvider).id;
}

String _$productsStateHash() => r'09c4f5dc52c80d35cce21bd87db416e68e76dc75';

/// See also [ProductsState].
@ProviderFor(ProductsState)
final productsStateProvider =
    AutoDisposeAsyncNotifierProvider<ProductsState, void>.internal(
  ProductsState.new,
  name: r'productsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsState = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
