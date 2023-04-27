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
        res += types[i] + ', ';
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
                  CachedNetworkImage(
                    imageUrl: state.pokemonDetails.imageUrl,
                    imageBuilder:
                        (BuildContext context, ImageProvider imageProvider) =>
                            Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                    ),
                    placeholder: (BuildContext context, String url) =>
                        const CircularProgressIndicator(),
                    errorWidget:
                        (BuildContext context, String url, dynamic error) =>
                            const Icon(Icons.error),
                  ),
                  Text('Types: ' + _types(state.pokemonDetails.types)),
                  Text('Weight: ' + state.pokemonDetails.weight.toString()),
                  Text('Height: ' + state.pokemonDetails.height.toString()),
                ],
              ),
            ),
          );
        }
        {
          return Scaffold(
            body: Center(
              child: state is DetailsStateError
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Oops, try to check internet connection or reload the page..',
                        ),
                        MaterialButton(
                          onPressed: () {
                            BlocProvider.of<DetailsBloc>(context).add(
                              InitDetailsEvent(url: state.currentUrl),
                            );
                          },
                          child: const Icon(Icons.restart_alt),
                        )
                      ],
                    )
                  : const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
