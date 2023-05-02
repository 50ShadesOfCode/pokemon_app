class NavigationException implements Exception {
  final String message;

  NavigationException({required this.message});

  @override
  String toString() => 'NavigationException: $message';
}
