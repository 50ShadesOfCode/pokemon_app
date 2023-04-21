import 'package:flutter/material.dart';
import 'package:pokemon/feature/home/bloc/home_bloc.dart';
import 'package:pokemon/feature/home/home_view.dart';
import 'package:pokemon/router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

class HomePage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
          child: const SafeArea(
            child: HomeView(),
          ),
        ),
      );
}
