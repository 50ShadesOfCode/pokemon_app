import 'package:flutter/material.dart';

class RouteConfiguration {
  final Page<dynamic> page;

  RouteConfiguration({required this.page});

  @override
  String toString() => 'RouteConfiguration for ${page.name}';
}
