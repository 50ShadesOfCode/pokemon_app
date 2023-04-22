import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'bloc/details_bloc.dart';

class DetailsView extends StatefulWidget {
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (BuildContext context, DetailsState state) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(state.pokemonDetails.name),
          ],
        ),
      ),
    );
  }
}
