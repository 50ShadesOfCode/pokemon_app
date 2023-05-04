import 'package:domain/domain.dart';

abstract class PokemonRepository {
  const PokemonRepository();
  Future<PokemonList> getPokemonList(String url);
  Future<PokemonDetails> getPokemonDetails(String url);
  Future<PokemonList> initPokemonList();
}
