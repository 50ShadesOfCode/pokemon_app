import 'package:domain/domain.dart';

class GetPokemonListUseCase extends FutureUseCase<PokemonList, String> {
  final PokemonRepository _pokemonRepository;

  GetPokemonListUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<PokemonList> execute(String params) async {
    return _pokemonRepository.getPokemonList(params);
  }
}
