import 'package:domain/domain.dart';

class DetailsState {}

class DetailsStateSuccess extends DetailsState {
  final PokemonDetails pokemonDetails;

  DetailsStateSuccess({
    required this.pokemonDetails,
  });
}
