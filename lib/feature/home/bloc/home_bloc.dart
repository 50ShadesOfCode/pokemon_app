import 'package:domain/domain.dart';
import 'package:pokemon/feature/details/details.dart';
import 'package:pokemon/router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApplicationRouter _applicationRouter;
  final GetPokemonListUseCase _getPokemonListUseCase;
  HomeBloc({
    required ApplicationRouter applicationRouter,
    required GetPokemonListUseCase getPokemonListUseCase,
  })  : _applicationRouter = applicationRouter,
        _getPokemonListUseCase = getPokemonListUseCase,
        super(HomeState(pokemonList: PokemonList.empty())) {
    on<InitListEvent>(_onInitList);
    on<OpenDetailsEvent>(_onOpenDetails);
    on<OpenPageEvent>(_onOpenPage);
  }

  Future<void> _onInitList(InitListEvent event, Emitter<HomeState> emit) async {
    emit(HomeState(pokemonList: await _getPokemonListUseCase.execute(null)));
  }

  void _onOpenDetails(OpenDetailsEvent event, Emitter<HomeState> emit) {
    _applicationRouter.push(Details.page(event.url));
    emit(state);
  }

  Future<void> _onOpenPage(OpenPageEvent event, Emitter<HomeState> emit) async {
    emit(HomeState(
        pokemonList: await _getPokemonListUseCase.execute(event.url)));
  }
}
