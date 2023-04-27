import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'pokemon_repository_test.mocks.dart';

void main() {
  final MockPokemonRepository repo = MockPokemonRepository();
  final GetPokemonListUseCase useCase = GetPokemonListUseCase(
    pokemonRepository: MockPokemonRepository(),
  );
  group('GetPokemonListUseCase', () {
    test('verify getPokemonList called once', () {
      const String params = 'https://pokeapi.co/api/v2/pokemon';
      useCase.execute(params);
      verify(repo.getPokemonList('https://pokeapi.co/api/v2/pokemon'))
          .called(1);
    });
  });
}
