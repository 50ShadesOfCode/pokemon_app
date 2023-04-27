import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'pokemon_repository_test.mocks.dart';

void main() {
  final MockPokemonRepository repo = MockPokemonRepository();
  final GetPokemonDetailsUseCase useCase = GetPokemonDetailsUseCase(
    pokemonRepository: MockPokemonRepository(),
  );
  group('GetPokemonDetailsUseCase', () {
    test('Verify repo.getPokemonDetails called once', () {
      const String params = 'https://pokeapi.co/api/v2/pokemon/2';
      useCase.execute(params);
      verify(repo.getPokemonDetails('https://pokeapi.co/api/v2/pokemon/2'))
          .called(1);
    });
  });
}
