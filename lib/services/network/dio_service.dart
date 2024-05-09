import 'package:dio/dio.dart';

class DioService {
  static final DioService _dioService = DioService._();

  final _dio = Dio();

  DioService._() {
    _dio.options = BaseOptions(connectTimeout: const Duration(seconds: 15));
  }

  factory DioService() => _dioService;

  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.get(
      path,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool retryIfConnectionFails = false,
  }) async {
    return await _dio.post(
      path,
      data: data,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: options,
      queryParameters: queryParameters,
    );
  }
}
