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

  Pokemon.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        url = json['url'] as String;

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
