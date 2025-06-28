


import 'package:dio/dio.dart';

class ApiError{
  late String errMessage;

  ApiError.errorCheck(DioException error){
    switch(error.type){
      case DioExceptionType.connectionTimeout:
        errMessage = 'connection timeout !';
      case DioExceptionType.sendTimeout:
        errMessage = 'connection Send timeout !';
      case DioExceptionType.receiveTimeout:
        errMessage = 'connection ReceiveTimeout !';
      case DioExceptionType.badCertificate:
        errMessage = ' bad Certificate!';


      case DioExceptionType.badResponse:
       switch(error.response?.statusCode){

      case 400:
          errMessage = '${error.response?.data}';
         case 401:
          errMessage = 'Unauthorized';
         case 403:
          errMessage = 'Forbidden';
         case 404:
          errMessage = 'Not Found';
         case 413:
           errMessage = 'File size is too large';
           case 405:
             errMessage = 'Method Not Allowed';
             case 500:
               errMessage = 'Internal Server Error';
       }

      case DioExceptionType.cancel:
        errMessage = 'Request to API server was cancelled';
      case DioExceptionType.connectionError:
        errMessage = 'please check your internet connection !';
      case DioExceptionType.unknown:
       errMessage = 'please check your internet connection !';
    }
  }

}