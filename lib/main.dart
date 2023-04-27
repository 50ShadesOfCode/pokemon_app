import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await dataDI.initHive();
  appDI.initDependencies();
  dataDI.initDependencies();
  runApp(const Application());
}
