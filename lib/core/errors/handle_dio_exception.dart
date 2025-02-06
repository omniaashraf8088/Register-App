import 'package:dio/dio.dart';

class HandleDioException {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timed out. Please check your internet connection';
        case DioExceptionType.sendTimeout:
          return 'Request timed out. Please try again';
        case DioExceptionType.receiveTimeout:
          return 'Server response timed out. Please try again';
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              return error.response?.data['message'] ?? 'Bad request';
            case 401:
              return 'Unauthorized access. Please login again';
            case 403:
              return 'Access forbidden. You don\'t have permission';
            case 404:
              return 'Requested resource not found';
            case 409:
              return error.response?.data['message'] ?? 'Conflict occurred';
            case 422:
              return error.response?.data['message'] ?? 'Validation error';
            case 500:
              return 'Server error. Please try again later';
            case 503:
              return 'Service unavailable. Please try again later';
            default:
              return error.response?.data['message'] ?? 'Something went wrong';
          }
        case DioExceptionType.cancel:
          return 'Request cancelled';
        case DioExceptionType.unknown:
          if (error.response?.data['message'] != null) {
            return error.response?.data['message'];
          }
          return 'Network error occurred. Please check your connection';
        case DioExceptionType.badCertificate:
          return 'Invalid SSL certificate. Please check your connection';
        case DioExceptionType.connectionError:
          return 'Connection error. Please check your internet';
      }
    }
    return 'Something went wrong. Please try again';
  }
}