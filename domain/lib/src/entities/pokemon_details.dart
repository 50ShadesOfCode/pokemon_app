class PokemonDetails {
  final String name;
  final String imageUrl;
  final List<String> types;
  final int weight;
  final int height;

  PokemonDetails({
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.weight,
    required this.height,
  });

  PokemonDetails.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        weight = json['weight'] as int,
        height = json['height'] as int,
        imageUrl = (json['sprites'] as Map<dynamic, dynamic>)['front_default']
            as String,
        types = (json['types'] as List<dynamic>)
            .map(
                (e) => ((e as Map<dynamic, dynamic>)['type']['name'] as String))
            .toList();
}
