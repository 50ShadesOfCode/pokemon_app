import 'package:domain/domain.dart';

class InitPokemonListUseCase extends FutureUseCase<PokemonList, NoParams> {
  final PokemonRepository _pokemonRepository;

  InitPokemonListUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<PokemonList> execute(NoParams params) async {
    return _pokemonRepository.initPokemonList();
  }
}
