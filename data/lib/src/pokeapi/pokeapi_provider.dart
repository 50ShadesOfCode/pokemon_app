import 'dart:async';
import 'dart:io';

import 'package:domain/domain.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

class PokeAPIProvider {
  final Dio _dio;
  final Box<dynamic> _listBox;
  final Box<dynamic> _detailsBox;
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
        ),
        _listBox = Hive.box("listBox"),
        _detailsBox = Hive.box("detailsBox");

  Future<PokemonList> getPokemonList(String url) async {
    dynamic res = _listBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _dio.get(url);
      /*if (response.statusCode! >= 400) {
        throw const HttpException('No internet connection');
      }*/
      _listBox.put(url, response.data);
      return PokemonList.fromJson(response.data);
    }
    return PokemonList.fromJson(res);
  }

  Future<PokemonDetails> getPokemonDetails(String url) async {
    dynamic res = _detailsBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _dio.get(url);
      /*if (response.statusCode! >= 400) {
        throw const HttpException('No internet connection');
      }*/
      _detailsBox.put(url, response.data);
      return PokemonDetails.fromJson(response.data);
    }
    return PokemonDetails.fromJson(res);
  }
}
