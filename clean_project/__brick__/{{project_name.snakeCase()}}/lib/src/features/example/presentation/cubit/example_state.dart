import 'package:equatable/equatable.dart';

import '../../../../core/ui/widgets/views/view_state.dart';
import '../../../../core/utils/result/result.dart';
import '../../domain/entities/example_entity.dart';
import '../../domain/failures/example_failure.dart';

sealed class ExampleState extends Equatable {
  const ExampleState();

  ViewState get viewState => switch (this) {
    ExampleInitial() => ViewState.initial,
    ExampleLoading() => ViewState.loading,
    ExampleSuccess() => ViewState.success,
    ExampleError(failure: final failure) => switch (failure.type) {
      ExampleFailure.noConnection => ViewState.errorConnection,
      _ => ViewState.errorServer,
    },
  };

  @override
  List<Object?> get props => [];
}

final class ExampleInitial extends ExampleState {
  const ExampleInitial();
}

final class ExampleLoading extends ExampleState {
  const ExampleLoading();
}

final class ExampleSuccess extends ExampleState {
  const ExampleSuccess(this.entity);

  final ExampleEntity entity;

  @override
  List<Object?> get props => [entity];
}

final class ExampleError extends ExampleState {
  const ExampleError(this.failure);

  final FailureInfo<ExampleFailure> failure;

  @override
  List<Object?> get props => [failure.type, failure.message];
}
