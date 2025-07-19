import 'package:async_provider/constants/apis.dart';
import 'package:async_provider/exception/api_error.dart';
import 'package:async_provider/models/product.dart';
import 'package:async_provider/shared/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_service.g.dart';

class ProductService {
  final Dio dio;
  ProductService(this.dio);

  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get(products);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on DioException catch (err) {
      throw ApiError.errorCheck(err).errMessage;
    }
  }

  Future<void> addProduct({
    required Map<String, dynamic> map,
    required XFile image,
  }) async {
    final formData = FormData.fromMap({
      ...map,
      'image': await MultipartFile.fromFile(image.path),
    });
    try {
      await dio.post(products, data: formData);
    } on DioException catch (err) {
      throw ApiError.errorCheck(err).errMessage;
    }
  }

  Future<void> updateProduct({
    required Map<String, dynamic> map, XFile? image, required String id,}) async {
    try {
      if (image == null) {
        await dio.patch('$products/$id', data: map);
      } else {
        final formData = FormData.fromMap({
          ...map,
          'image': await MultipartFile.fromFile(image.path),
        });
        await dio.patch('$products/$id', data: formData);
      }
    } on DioException catch (err) {
      throw ApiError.errorCheck(err).errMessage;
    }
  }

  Future<void> removeProduct({required String id}) async {
    try {
      await dio.delete('$products/$id');
    } on DioException catch (err) {
      throw ApiError.errorCheck(err).errMessage;
    }
  }
}

@riverpod
ProductService productService(Ref ref) {
  return ProductService(ref.watch(clientProvider));
}
