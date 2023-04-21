import 'package:data/src/pokeapi/pokeapi_provider.dart';
import 'package:domain/domain.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokeAPIProvider apiProvider;

  PokemonRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<PokemonDetails> getPokemonDetails(String url) {
    // TODO: implement getPokemonDetails
    throw UnimplementedError();
  }

  @override
  Future<PokemonList> getPokemonList(String? url) {
    // TODO: implement getPokemonList
    throw UnimplementedError();
  }
}
