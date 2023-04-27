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
}
