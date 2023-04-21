import 'package:data/src/pokeapi/pokeapi_provider.dart';
import 'package:domain/domain.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokeAPIProvider apiProvider;

  PokemonRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<PokemonDetails> getPokemonDetails() {
    // TODO: implement getPokemonDetails
    throw UnimplementedError();
  }

  @override
  Future<PokemonList> getPokemonList() {
    // TODO: implement getPokemonList
    throw UnimplementedError();
  }
}
