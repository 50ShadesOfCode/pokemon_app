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
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              state is HomeStateSuccess && state.pokemonList.previous != null
                  ? const BottomNavigationBarItem(
                      icon: Icon(Icons.skip_previous),
                      label: 'Previous',
                    )
                  : const BottomNavigationBarItem(
                      label: 'Previous',
                      icon: Icon(
                        Icons.skip_previous,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                    ),
              state is HomeStateSuccess && state.pokemonList.next != null
                  ? const BottomNavigationBarItem(
                      icon: Icon(Icons.skip_next),
                      label: 'Next',
                    )
                  : const BottomNavigationBarItem(
                      label: 'Next',
                      icon: Icon(
                        Icons.skip_next,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                    ),
            ],
            onTap: (int index) {
              if (index == 0 &&
                  state is HomeStateSuccess &&
                  state.pokemonList.previous != null) {
                BlocProvider.of<HomeBloc>(context).add(
                  OpenPageEvent(url: state.pokemonList.previous!),
                );
              } else if (index == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No previous page'),
                  ),
                );
              }
              if (index == 1 &&
                  state is HomeStateSuccess &&
                  state.pokemonList.next != null) {
                BlocProvider.of<HomeBloc>(context).add(
                  OpenPageEvent(url: state.pokemonList.next!),
                );
              } else if (index == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No next page'),
                  ),
                );
              }
            },
          ),
          body: state is HomeStateSuccess
              ? ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.separated(
                    itemCount: state.pokemonList.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context).add(
                            OpenDetailsEvent(
                                url: state.pokemonList.results[index].url),
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
                )
              : state is HomeStateError
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Oops, try to check internet connection or reload the page..',
                          ),
                          MaterialButton(
                            onPressed: () {
                              BlocProvider.of<HomeBloc>(context).add(
                                OpenPageEvent(url: state.currentUrl),
                              );
                            },
                            child: const Icon(Icons.restart_alt),
                          )
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(),
        );
      },
    );
  }
}
