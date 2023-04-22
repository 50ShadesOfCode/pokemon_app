import 'package:domain/domain.dart';
import 'package:pokemon/router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApplicationRouter _applicationRouter;
  HomeBloc({
    required ApplicationRouter applicationRouter,
  })  : _applicationRouter = applicationRouter,
        super(HomeState(pokemonList: PokemonList.empty()));
}
