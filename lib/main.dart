import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  appDI.initDependencies();
  dataDI.initDependencies();
  await dataDI.initHive();
  runApp(const Application());
}
