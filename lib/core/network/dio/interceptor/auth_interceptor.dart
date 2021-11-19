import 'package:dio/dio.dart';

class AuthInterceptors extends Interceptor {
  final Dio dio;
  AuthInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if  (err.response?.statusCode == 403 || err.response?.statusCode == 401){
    }else{
    }
    handler.next(err);
  }
}
