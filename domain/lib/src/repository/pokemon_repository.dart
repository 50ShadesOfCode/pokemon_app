import 'package:domain/domain.dart';

abstract class PokemonRepository {
  const PokemonRepository();

  Future<PokemonList> getPokemonList();

  Future<PokemonDetails> getPokemonDetails();
}
