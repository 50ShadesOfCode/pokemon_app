import 'package:core/core.dart';
import 'package:details/src/bloc/details_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:details/src/details_view.dart';

class DetailsPage extends PageWithScaffoldKey<dynamic> {
  final String url;

  DetailsPage({
    required this.url,
  });

  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<DetailsBloc>(
          create: (_) => DetailsBloc(
            getPokemonDetailsUseCase:
                appLocator.get<GetPokemonDetailsUseCase>(),
          )..add(
              InitDetailsEvent(url: url),
            ),
          child: const SafeArea(
            child: DetailsView(),
          ),
        ),
      );
}
