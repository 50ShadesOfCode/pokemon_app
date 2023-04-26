import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'bloc/details_bloc.dart';

class DetailsView extends StatefulWidget {
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  String _types(List<String> types) {
    String res = '';
    for (int i = 0; i < types.length; ++i) {
      if (i != types.length - 1) {
        res += types[i] + ',';
      } else {
        res += types[i];
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (BuildContext context, DetailsState state) {
        if (state is DetailsStateSuccess) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(state.pokemonDetails.name),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    state.pokemonDetails.imageUrl,
                    scale: 0.5,
                  ),
                  Text('Types: ' + _types(state.pokemonDetails.types)),
                  Text('Weight: ' + state.pokemonDetails.weight.toString()),
                  Text('Height: ' + state.pokemonDetails.height.toString()),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
