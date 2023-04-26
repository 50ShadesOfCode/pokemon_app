import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appDI.initDependencies();
  dataDI.initDependencies();
  runApp(const Application());
}
