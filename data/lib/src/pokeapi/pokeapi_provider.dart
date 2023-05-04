import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

class PokeAPIProvider {
  final HttpClient _httpClient;
  final Box<dynamic> _listBox;
  final Box<dynamic> _detailsBox;
  PokeAPIProvider({required HttpClient httpClient})
      : _httpClient = httpClient,
        _listBox = Hive.box("listBox"),
        _detailsBox = Hive.box("detailsBox");

  Future<PokemonList> getPokemonList(String url) async {
    dynamic res = _listBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _httpClient.get(url);
      _listBox.put(url, response.data);
      return PokemonListMapper.fromJson(response.data);
    }
    return PokemonListMapper.fromJson(res);
  }

  Future<PokemonDetails> getPokemonDetails(String url) async {
    dynamic res = _detailsBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _httpClient.get(url);
      _detailsBox.put(url, response.data);
      return PokemonDetailsMapper.fromJson(response.data);
    }
    return PokemonDetailsMapper.fromJson(res);
  }

  Future<PokemonList> initPokemonList() async {
    String url = 'https://pokeapi.co/api/v2/pokemon';
    dynamic res = _listBox.get(url);
    if (res == null) {
      Response<dynamic> response = await _httpClient.get(url);
      _listBox.put(url, response.data);
      return PokemonListMapper.fromJson(response.data);
    }
    return PokemonListMapper.fromJson(res);
  }
}
