import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    appLocator.registerSingleton<PokeAPIProvider>(
      PokeAPIProvider(
        httpClient: appLocator.get<HttpClient>(),
      ),
    );
    appLocator.registerSingleton<HttpClient>(
      HttpClient(),
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
    appLocator
        .registerFactory<InitPokemonListUseCase>(() => InitPokemonListUseCase(
              pokemonRepository: appLocator.get<PokemonRepository>(),
            ));
  }

  Future<void> initHive() async {
    await Hive.openBox('listBox');
    await Hive.openBox('detailsBox');
  }
}
