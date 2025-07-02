//
//
// import 'package:async_provider/constants/apis.dart';
// import 'package:async_provider/exception/api_error.dart';
// import 'package:async_provider/shared/dio_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'auth_service.g.dart';
//
// class ProductService {
//   final Dio dio;
//   ProductService(this.dio);
//
//   Future loginUser() async {
//     try {
//       final response = await dio.get(products);
//       return response.data;
//     } on DioException catch (err) {
//       throw ApiError.errorCheck(err).errMessage;
//     }
//   }
//
//
//
// }
//
// @riverpod
// ProductService productService(Ref ref) {
//   return ProductService(ref.watch(clientProvider));
// }
