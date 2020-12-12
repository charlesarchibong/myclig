import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/interceptors/retry_request_interceptor.dart';

class HttpServiceRequester {
  final Dio dio;
  final DioCacheManager dioCacheManager;
  final RetryOnConnectionChangeInterceptor retryOnConnectionChangeInterceptor;
  HttpServiceRequester({
    @required this.dio,
    @required this.dioCacheManager,
    @required this.retryOnConnectionChangeInterceptor,
  });

  Future<Response> post({
    @required String url,
    String token,
    dynamic body,
    @required String contentType,
    Map queryParam,
  }) async {
    dio.interceptors.add(retryOnConnectionChangeInterceptor);

    dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await dio.post(
      url,
      data: body,
      queryParameters: queryParam,
      options: Options(
        contentType: contentType,
        // headers: {headers,
        // followRedirects: true,
      ),
    );
    return response;
  }

  Future<Response> upload({
    @required String url,
    Map headers,
    @required dynamic body,
    @required contentType,
    Map queryParam,
  }) async {
    dio.interceptors.add(sl<RetryOnConnectionChangeInterceptor>());

    Response response = await dio.post(
      url,
      data: body,
      queryParameters: queryParam,
      options: Options(
        contentType: contentType,
        headers: headers,
      ),
    );
    return response;
  }

  Future<dynamic> getRequest({@required String url, String token
      // Map queryParam,
      }) async {
    print(url);
    dio.interceptors.add(retryOnConnectionChangeInterceptor);

    dio.interceptors.add(dioCacheManager.interceptor);

    Options _cacheOptions = buildCacheOptions(
      Duration(
        minutes: 50,
      ),
    );
    dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await dio.get(
      url,
      options: _cacheOptions,
    );
    return response;
  }

  Future<dynamic> delete({
    @required String url,
    Map headers,
    Map queryParam,
    @required contentType,
  }) async {
    dio.interceptors.add(sl<RetryOnConnectionChangeInterceptor>());

    dio.options.headers = headers;
    Response response = await dio.delete(url,
        queryParameters: queryParam,
        options: Options(
          contentType: contentType,
          headers: headers,
        ));
    return response;
  }

  Future<dynamic> put({
    @required String url,
    Map headers,
    @required Map data,
    @required contentType,
  }) async {
    dio.interceptors.add(sl<RetryOnConnectionChangeInterceptor>());
    dio.options.headers = headers;
    Response response = await dio.put(url,
        data: data,
        options: Options(
          contentType: contentType,
          headers: headers,
        ));
    return response;
  }
}
