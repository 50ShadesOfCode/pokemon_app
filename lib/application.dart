import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:router/router.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final ApplicationRouter applicationRouter;
  late final RouteInformationParser<RouteConfiguration> routeInformationParser;

  @override
  void initState() {
    super.initState();
    applicationRouter = appLocator.get<ApplicationRouter>();
    routeInformationParser = appLocator.get<AppRouteInformationParser>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: applicationRouter,
      routeInformationParser: routeInformationParser,
    );
  }
}
