import 'package:flutter/material.dart';
import 'package:details/src/details_page.dart';

class Details {
  static Page<dynamic> page(String url) => DetailsPage(url: url);
}
