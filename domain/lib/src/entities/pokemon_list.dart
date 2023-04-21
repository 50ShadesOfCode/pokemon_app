import 'package:shared_dependencies/shared_dependencies.dart';
import 'pokemon.dart';

part 'pokemon_list.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonList {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  PokemonList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      _$PokemonListFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListToJson(this);
}
