import 'package:domain/domain.dart';

extension PokemonDetailsMapper on PokemonDetails {
  static PokemonDetails fromJson(Map<dynamic, dynamic> json) {
    return PokemonDetails(
      name: json['name'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      imageUrl:
          (json['sprites'] as Map<dynamic, dynamic>)['front_default'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => ((e as Map<dynamic, dynamic>)['type']['name'] as String))
          .toList(),
    );
  }
}
