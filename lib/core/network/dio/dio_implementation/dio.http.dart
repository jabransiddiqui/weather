import 'dart:convert';
import 'package:dio/dio.dart';

import '/core/core.dart';

class HTTP implements IHTTP {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiRoutes.baseUrl));
  HTTP._privateConstructor() {
    dio.interceptors.add(AuthInterceptors(dio));
    dio.interceptors.add(TokenInterceptors());
  }

  static final HTTP _instance = HTTP._privateConstructor();

  static HTTP get instance => _instance;

  @override
  Future<dynamic> iDelete(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
          await dio.delete(url, data: data, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iGet(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.get(url, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iPost(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.post(url,
          data: json.encode(data), queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iPut(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.put(url,
          data: json.encode(data), queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
