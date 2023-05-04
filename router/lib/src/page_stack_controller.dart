import 'package:flutter/material.dart';

import 'exceptions/navigation_exception.dart';

mixin PageStackController on ChangeNotifier {
  final List<Page<dynamic>> _pages = <Page<dynamic>>[];

  List<Page<dynamic>> get pages => List<Page<dynamic>>.unmodifiable(_pages);

  void push(Page<dynamic> page) {
    _pages.add(page);
    notifyListeners();
  }

  void pushAll(List<Page<dynamic>> pages) {
    _pages.addAll(pages);
    notifyListeners();
  }

  void remove(Page<dynamic> page) {
    _pages.remove(page);
    notifyListeners();
  }

  void replace(Page<dynamic> page) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      push(page);
    } else {
      push(page);
    }
    notifyListeners();
  }

  void replaceLastWith(List<Page<dynamic>> pages) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      pushAll(pages);
    } else {
      pushAll(pages);
    }
    notifyListeners();
  }

  void resetTo(Page<dynamic> page) {
    _pages
      ..clear()
      ..add(page);
    notifyListeners();
  }

  void popUntil(String pageName) {
    final int index =
        _pages.indexWhere((Page<dynamic> page) => page.name == pageName);
    if (index == -1) {
      throw NavigationException(message: 'Page not found');
    }
    _pages.removeRange(index + 1, _pages.length);
    notifyListeners();
  }

  void popUntilPage(Page<dynamic> untilPage) {
    final int index =
        _pages.indexWhere((Page<dynamic> page) => page.name == untilPage.name);

    if (index == -1) {
      throw NavigationException(message: 'Page not found');
    }
    _pages.removeRange(index + 1, _pages.length);
    notifyListeners();
  }

  void pop() {
    _pages.removeLast();
    notifyListeners();
  }

  void resetToFirst() {
    _pages.removeRange(1, _pages.length);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
