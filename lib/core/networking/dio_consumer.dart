import 'package:dio/dio.dart';

import '../errors/handle_dio_exception.dart';
import 'api_consumer.dart';
import 'dio_factory.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  
  DioConsumer() : dio = DioFactory.getDio();

  @override
  Future<dynamic> post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(path,
          data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      throw HandleDioException.getErrorMessage(error);
    }
  }

  @override
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path,
          data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      throw HandleDioException.getErrorMessage(error);
    }
  }

  @override
  Future<dynamic> delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.delete(path,
          data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      throw HandleDioException.getErrorMessage(error);
    }
  }

  @override
  Future<dynamic> update(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.put(path,
          data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      throw HandleDioException.getErrorMessage(error);
    }
  }
}