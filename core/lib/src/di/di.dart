import 'package:router/router.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

final GetIt appLocator = GetIt.instance;
final AppDI appDI = AppDI();

class AppDI {
  void initDependencies() {
    appLocator.registerSingleton<ApplicationRouter>(
      ApplicationRouter(),
    );
    appLocator.registerSingleton<AppRouteInformationParser>(
      AppRouteInformationParser(),
    );
  }
}
