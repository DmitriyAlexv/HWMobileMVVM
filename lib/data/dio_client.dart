import "package:dio/dio.dart";

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio() {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }
}