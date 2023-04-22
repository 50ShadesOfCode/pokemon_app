import 'package:flutter/foundation.dart';

@immutable
abstract class DetailsEvent {}

class InitDetailsEvent extends DetailsEvent {
  final String url;

  InitDetailsEvent({
    required this.url,
  });
}
