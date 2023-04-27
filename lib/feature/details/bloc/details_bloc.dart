import 'package:domain/domain.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

import 'details_event.dart';
import 'details_state.dart';

export 'details_event.dart';
export 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetPokemonDetailsUseCase _getPokemonDetailsUseCase;
  DetailsBloc({
    required GetPokemonDetailsUseCase getPokemonDetailsUseCase,
  })  : _getPokemonDetailsUseCase = getPokemonDetailsUseCase,
        super(DetailsState()) {
    on<InitDetailsEvent>(_onInitDetails);
  }

  Future<void> _onInitDetails(
      InitDetailsEvent event, Emitter<DetailsState> emit) async {
    try {
      await _getPokemonDetailsUseCase.execute(event.url);
    } catch (_) {
      emit(DetailsStateError(currentUrl: event.url));
      return;
    }
    emit(
      DetailsStateSuccess(
        pokemonDetails: await _getPokemonDetailsUseCase.execute(event.url),
      ),
    );
  }
}
