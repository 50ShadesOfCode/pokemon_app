import 'dart:convert';

import 'package:domain/domain.dart';
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

  Future<PokemonList> getPokemonList(String? url) async {
    Response<dynamic> response =
        await _dio.get(url ?? 'https://pokeapi.co/api/v2/pokemon');
    return PokemonList.fromJson(response.data);
  }

  Future<PokemonDetails> getPokemonDetails(String url) async {
    Response<dynamic> response = await _dio.get(url);
    return PokemonDetails.fromJson(response.data);
  }
}
