abstract class UseCase<OutputT, InputT> {
  OutputT execute(InputT params);
}

abstract class FutureUseCase<OutputT, InputT> {
  Future<OutputT> execute(InputT params);
}

class NoParams {}
