import 'package:shared_dependencies/shared_dependencies.dart';

class PokeAPIProvider {
  final Dio _dio;

  PokeAPIProvider()
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
}
