import 'package:shared_dependencies/shared_dependencies.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
