/// Tipo selado (sealed class) para representar o resultado de operações
/// que podem falhar de forma tipada.
///
/// Uso:
/// ```dart
/// final result = await repository.getData();
/// result.fold(
///   (failure) => print('Erro: ${failure.message}'),
///   (data) => print('Sucesso: $data'),
/// );
/// ```
sealed class Result<T extends FailureType, S> {
  const Result();

  B fold<B>(
    B Function(FailureInfo<T>) onFailure,
    B Function(S) onSuccess,
  ) {
    return switch (this) {
      Failure<T, S>(error: final error) => onFailure(error),
      Success<T, S>(object: final value) => onSuccess(value),
    };
  }
}

final class Success<T extends FailureType, S> extends Result<T, S> {
  const Success(this.object);

  final S object;
}

final class Failure<T extends FailureType, S> extends Result<T, S> {
  const Failure(this.error, {Object? message});

  final FailureInfo<T> error;
}

/// Marcador para tipos de falha. Cada feature cria o seu próprio enum
/// que implementa [FailureType].
abstract class FailureType {}

/// Container de informação sobre a falha ocorrida.
class FailureInfo<T extends FailureType> {
  const FailureInfo({
    required this.type,
    this.message,
  });

  final T type;
  final String? message;
}
