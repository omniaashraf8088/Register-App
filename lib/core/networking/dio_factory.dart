import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Define a factory class to create and manage Dio instances
class DioFactory {
  // Private constructor prevents instantiation of this class
  // Forces usage of static methods only
  DioFactory._();

  // Static variable to hold single Dio instance (singleton pattern)
  static Dio? dio;

  // Static method to get Dio instance, creates new one if none exists
  static Dio getDio() {
    // Define timeout duration of 30 seconds
    Duration timeOut = const Duration(seconds: 30);

    // Check if Dio instance exists
    if (dio == null) {
      // Create new Dio instance
      dio = Dio();
      // Configure timeouts using cascade notation (..)
      dio!
        ..options.connectTimeout = timeOut    // Set connection timeout
        ..options.receiveTimeout = timeOut;   // Set receive timeout
      // Add logging interceptor
      addDioInterceptor();
      // Return configured Dio instance
      return dio!;
    } else {
      // Return existing Dio instance
      return dio!;
    }
  }

  // Static method to add logging interceptor to Dio instance
  static void addDioInterceptor() {
    // Add PrettyDioLogger to interceptors list
    dio?.interceptors.add(
      // Configure logger to show request/response details
      PrettyDioLogger(
        requestBody: true,      // Log request body
        requestHeader: true,    // Log request headers
        responseHeader: true,   // Log response headers
      ),
    );
  }
}