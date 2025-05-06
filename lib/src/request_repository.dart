import 'package:dio/dio.dart';

final class Request {
  final _dio = Dio();
  final _url = "https://api.mercadopago.com/";

  Future<dynamic> post({
    required String path,
    required String accessToken,
    String? idempotencyKey,
    Map<String, dynamic> data = const {},
  }) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $accessToken";
      _dio.options.headers['content-Type'] = 'application/json';
      if (idempotencyKey != null)
        _dio.options.headers['X-Idempotency-Key'] = idempotencyKey;

      print(_url + path);

      final result = await _dio.post(_url + path, data: data);
      return result.data;
    } on DioException catch (e) {
      print(e.response!.data);

      throw e.message ?? e.toString();
    }
  }

  Future<dynamic> put({
    required String path,
    required String accessToken,
    Map<String, dynamic> data = const {},
  }) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $accessToken";
      _dio.options.headers['content-Type'] = 'application/json';

      print(_url + path);

      final result = await _dio.put(_url + path, data: data);
      return result.data;
    } on DioException catch (e) {
      print(e.response!.data);

      throw e.message ?? e.toString();
    }
  }

  Future<dynamic> get({
    required String path,
    required String accessToken,
    Map<String, dynamic> data = const {},
  }) async {
    _dio.options.headers["Authorization"] = "Bearer $accessToken";
    _dio.options.headers['content-Type'] = 'application/json';

    print('Bearer $accessToken');
    print(_url + path);

    final result = await _dio.get(_url + path);
    return result.data;
  }

  Future<dynamic> delete({
    required String path,
    required String accessToken,
    Map<String, dynamic> data = const {},
  }) async {
    _dio.options.headers["Authorization"] = "Bearer $accessToken";
    _dio.options.headers['content-Type'] = 'application/json';

    final result = await _dio.delete(_url + path);
    return result.data;
  }
}
