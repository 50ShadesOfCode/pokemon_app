import 'package:domain/domain.dart';
import 'package:domain/src/usecase/usecase.dart';

class GetPokemonDetailsUseCase extends FutureUseCase<PokemonDetails, String> {
  final PokemonRepository _pokemonRepository;

  GetPokemonDetailsUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<PokemonDetails> execute(String params) async {
    return _pokemonRepository.getPokemonDetails(params);
  }
}
