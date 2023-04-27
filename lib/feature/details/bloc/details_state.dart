import 'package:domain/domain.dart';

class DetailsState {}

class DetailsStateSuccess extends DetailsState {
  final PokemonDetails pokemonDetails;

  DetailsStateSuccess({
    required this.pokemonDetails,
  });
}

class DetailsStateError extends DetailsState {
  final String currentUrl;

  DetailsStateError({
    required this.currentUrl,
  });
}
