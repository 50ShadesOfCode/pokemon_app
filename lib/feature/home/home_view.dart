import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

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
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            state.pokemonList.previous != null
                ? const BottomNavigationBarItem(
                    icon: Icon(Icons.skip_previous), label: 'Previous')
                : const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.grey,
                    ),
                  ),
            state.pokemonList.next != null
                ? const BottomNavigationBarItem(
                    icon: Icon(Icons.skip_next),
                  )
                : const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.grey,
                    ),
                  ),
          ],
          onTap: (int index) {
            if (index == 0 && state.pokemonList.previous != null) {
              BlocProvider.of<HomeBloc>(context).add(
                OpenPageEvent(url: state.pokemonList.previous!),
              );
            }
            if (index == 1 && state.pokemonList.next != null) {
              BlocProvider.of<HomeBloc>(context).add(
                OpenPageEvent(url: state.pokemonList.next!),
              );
            }
          },
        ),
        body: ScrollConfiguration(
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
                child: Container(
                  height: 33,
                  alignment: Alignment.center,
                  child: Text(state.pokemonList.results[index].name),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                width: 100,
                padding: EdgeInsets.zero,
                height: 0.5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
