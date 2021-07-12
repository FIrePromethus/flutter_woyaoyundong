import 'package:dio/dio.dart';

class HttpConfig {
  static const baseUrl = "https://httpbin.org";
  static const timeout = 5000;
}

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeout);
  static Dio dio = Dio(baseOptions);
  static Future<T> request<T>(String method="get", Map<String, dynamic>params, Interceptor inter) {
    final options = Options(method: method);
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options) {
        return options;
      },
      onResponse: (Response response) {
        return response;
      },
      onError: (e) {
        return e;
      },
    );
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);
    try {
      Response response = await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    }on DioError catch (e) {

    }
  }
}
