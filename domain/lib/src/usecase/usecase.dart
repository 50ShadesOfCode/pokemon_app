import 'package:shared_dependencies/shared_dependencies.dart';

abstract class UseCase<OutputT, InputT> {
  OutputT execute(InputT params);
}

abstract class FutureUseCase<OutputT, InputT> {
  Future<OutputT> execute(InputT params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
