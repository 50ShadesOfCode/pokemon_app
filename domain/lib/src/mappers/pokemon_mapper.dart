import 'package:domain/domain.dart';

extension PokemonMapper on Pokemon {
  static Pokemon fromJson(Map<dynamic, dynamic> json) {
    return Pokemon(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
