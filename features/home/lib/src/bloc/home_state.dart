import 'package:domain/domain.dart';

class HomeState {}

class HomeStateSuccess extends HomeState {
  final PokemonList pokemonList;

  HomeStateSuccess({required this.pokemonList});
}

class HomeStateError extends HomeState {
  final String currentUrl;

  HomeStateError({
    required this.currentUrl,
  });
}
