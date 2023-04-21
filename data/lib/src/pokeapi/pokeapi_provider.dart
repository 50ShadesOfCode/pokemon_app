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
    Response<dynamic> response = await _dio
        .get(url != null ? 'https://pokeapi.co/api/v2/pokemon' : url!);
    Map<String, dynamic> data = jsonDecode(response.data);
    return PokemonList.fromJson(data);
  }

  Future<PokemonDetails> getPokemonDetails(String url) async {
    Response<dynamic> response = await _dio.get(url);
    Map<String, dynamic> data = jsonDecode(response.data);
    return PokemonDetails.fromJson(data);
  }
}
