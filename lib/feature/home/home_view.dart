import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.separated(
          itemCount: state.pokemonList.results.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                BlocProvider.of<HomeBloc>(context).add(
                  OpenDetailsEvent(url: state.pokemonList.results[index].url),
                );
              },
              child: Text(state.pokemonList.results[index].name),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: 100,
              padding: EdgeInsets.zero,
              height: 0.5,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            );
          },
        ),
      );
    });
  }
}
