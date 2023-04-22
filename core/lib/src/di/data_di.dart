import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    appLocator.registerSingleton<PokeAPIProvider>(
      PokeAPIProvider(),
    );
    appLocator.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(
        apiProvider: appLocator.get<PokeAPIProvider>(),
      ),
    );
    appLocator.registerFactory<GetPokemonDetailsUseCase>(
      () => GetPokemonDetailsUseCase(
        pokemonRepository: appLocator.get<PokemonRepository>(),
      ),
    );
    appLocator.registerFactory<GetPokemonListUseCase>(
      () => GetPokemonListUseCase(
        pokemonRepository: appLocator.get<PokemonRepository>(),
      ),
    );
  }
}