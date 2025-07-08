import 'package:async_provider/models/product.dart';
import 'package:async_provider/services/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'product_provider.g.dart';

@riverpod
Future<List<Product>> getProducts (Ref ref) async {
  return ref.read(productServiceProvider).getProducts() ;
}
