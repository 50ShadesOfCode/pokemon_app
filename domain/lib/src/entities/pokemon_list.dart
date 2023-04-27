import 'package:shared_dependencies/shared_dependencies.dart';
import 'pokemon.dart';

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

  PokemonList.fromJson(Map<dynamic, dynamic> json)
      : count = json['count'] as int,
        next = json['next'] as String?,
        previous = json['previous'] as String?,
        results = (json['results'] as List<dynamic>)
            .map((e) => Pokemon.fromJson(e))
            .toList();
}
