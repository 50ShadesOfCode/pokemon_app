import 'package:shared_dependencies/shared_dependencies.dart';

class HttpClient {
  final Dio _dio;

  HttpClient()
      : _dio = Dio(
          BaseOptions(
            headers: <String, dynamic>{
              'Accept-Charset': 'utf-8',
              'User-Agent': 'DartyFM',
            },
            contentType: Headers.formUrlEncodedContentType,
            responseType: ResponseType.json,
          ),
        );

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, Map<String, dynamic>? data) async {
    return await _dio.post(url, data: data);
  }
}
