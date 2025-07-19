import 'package:async_provider/models/product.dart';
import 'package:async_provider/services/product/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'product_provider.g.dart';

@riverpod
Future<List<Product>> getProducts (Ref ref) async {
  return ref.read(productServiceProvider).getProducts() ;
}

@riverpod
class ProductsState extends _$ProductsState {
  @override
  FutureOr<void> build()  {

  }

  Future<void> addProduct({required Map<String, dynamic> map, required XFile image}) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(()=> ref.read(productServiceProvider).addProduct(map: map, image: image));
  }

  Future<void> updateProduct({ required Map<String, dynamic> map, XFile? image, required String id }) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(()=> ref.read(productServiceProvider).updateProduct(map: map, image: image, id: id));
  }

  Future<void> removeProduct({required String id, }) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(()=> ref.read(productServiceProvider).removeProduct(id: id));
  }

}
