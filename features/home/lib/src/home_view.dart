import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:core_ui/core_ui.dart';

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
        if (state is HomeStateError) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(AppStrings.networkErrorMessage),
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(OpenPageEvent(url: state.currentUrl));
                    },
                    child: const Icon(Icons.restart_alt),
                  )
                ],
              ),
            ),
          );
        } else if (state is HomeStateSuccess) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.blue,
              items: <BottomNavigationBarItem>[
                state.pokemonList.previous != null
                    ? const BottomNavigationBarItem(
                        icon: Icon(Icons.skip_previous),
                        label: AppStrings.previousLabel,
                      )
                    : const BottomNavigationBarItem(
                        label: AppStrings.previousLabel,
                        icon: Icon(
                          Icons.skip_previous,
                          color: AppTheme.inactiveColor,
                        ),
                      ),
                state.pokemonList.next != null
                    ? const BottomNavigationBarItem(
                        icon: Icon(Icons.skip_next),
                        label: AppStrings.nextLabel,
                      )
                    : const BottomNavigationBarItem(
                        label: AppStrings.nextLabel,
                        icon: Icon(
                          Icons.skip_next,
                          color: AppTheme.inactiveColor,
                        ),
                      ),
              ],
              onTap: (int index) {
                if (index == 0 && state.pokemonList.previous != null) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(OpenPageEvent(url: state.pokemonList.previous!));
                } else if (index == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.noPreviousPageWarning),
                    ),
                  );
                }
                if (index == 1 && state.pokemonList.next != null) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(OpenPageEvent(url: state.pokemonList.next!));
                } else if (index == 1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.noNextPageWarning),
                    ),
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
                      BlocProvider.of<HomeBloc>(context).add(OpenDetailsEvent(
                          url: state.pokemonList.results[index].url));
                    },
                    child: Container(
                      height: Dimensions.ITEM_HEIGHT_33,
                      alignment: Alignment.center,
                      child: Text(state.pokemonList.results[index].name),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    width: Dimensions.ITEM_WIDTH_100,
                    padding: EdgeInsets.zero,
                    height: Dimensions.ITEM_HEIGHT_05,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
