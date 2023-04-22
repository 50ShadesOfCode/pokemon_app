import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/feature/details/bloc/details_bloc.dart';
import 'package:pokemon/router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'details_view.dart';

class DetailsPage extends PageWithScaffoldKey<dynamic> {
  final String url;
  DetailsPage({
    required this.url,
  });

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => BlocProvider<DetailsBloc>(
        create: (_) => DetailsBloc(
          getPokemonDetailsUseCase: appLocator.get<GetPokemonDetailsUseCase>(),
        )..add(
            InitDetailsEvent(
              url: url,
            ),
          ),
        child: DetailsView(),
      ),
    );
  }
}
