import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:home/src/home_view.dart';
import 'package:router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

class HomePage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            applicationRouter: appLocator.get<ApplicationRouter>(),
            getPokemonListUseCase: appLocator.get<GetPokemonListUseCase>(),
            initPokemonListUseCase: appLocator.get<InitPokemonListUseCase>(),
          )..add(
              InitListEvent(),
            ),
          child: const SafeArea(
            child: HomeView(),
          ),
        ),
      );
}
