import 'package:data/src/pokeapi/pokeapi_provider.dart';
import 'package:domain/domain.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokeAPIProvider apiProvider;

  PokemonRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<PokemonDetails> getPokemonDetails(String url) {
    return apiProvider.getPokemonDetails(url);
  }

  @override
  Future<PokemonList> getPokemonList(String url) {
    return apiProvider.getPokemonList(url);
  }

  @override
  Future<PokemonList> initPokemonList() {
    return apiProvider.initPokemonList();
  }
}
