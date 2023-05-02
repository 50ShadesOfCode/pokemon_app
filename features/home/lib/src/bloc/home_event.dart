import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEvent {}

class InitListEvent extends HomeEvent {}

class OpenDetailsEvent extends HomeEvent {
  final String url;

  OpenDetailsEvent({required this.url});
}

class OpenPageEvent extends HomeEvent {
  final String url;

  OpenPageEvent({required this.url});
}
