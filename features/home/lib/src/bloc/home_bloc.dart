import 'package:domain/domain.dart';
import 'package:details/details.dart';
import 'package:router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApplicationRouter _applicationRouter;
  final GetPokemonListUseCase _getPokemonListUseCase;
  final InitPokemonListUseCase _initPokemonListUseCase;

  HomeBloc({
    required ApplicationRouter applicationRouter,
    required GetPokemonListUseCase getPokemonListUseCase,
    required InitPokemonListUseCase initPokemonListUseCase,
  })  : _applicationRouter = applicationRouter,
        _getPokemonListUseCase = getPokemonListUseCase,
        _initPokemonListUseCase = initPokemonListUseCase,
        super(HomeState()) {
    on<InitListEvent>(_onInitList);
    on<OpenDetailsEvent>(_onOpenDetails);
    on<OpenPageEvent>(_onOpenPage);
  }

  Future<void> _onInitList(InitListEvent event, Emitter<HomeState> emit) async {
    try {
      await _initPokemonListUseCase.execute(NoParams());
    } catch (_) {
      emit(HomeStateError(currentUrl: 'https://pokeapi.co/api/v2/pokemon'));
      return;
    }
    emit(HomeStateSuccess(
      pokemonList: await _initPokemonListUseCase.execute(NoParams()),
    ));
  }

  void _onOpenDetails(OpenDetailsEvent event, Emitter<HomeState> emit) {
    _applicationRouter.push(Details.page(event.url));
    emit(state);
  }

  Future<void> _onOpenPage(OpenPageEvent event, Emitter<HomeState> emit) async {
    try {
      await _getPokemonListUseCase.execute(event.url);
    } catch (_) {
      emit(HomeStateError(currentUrl: event.url));
      return;
    }
    emit(HomeStateSuccess(
      pokemonList: await _getPokemonListUseCase.execute(event.url),
    ));
  }
}
