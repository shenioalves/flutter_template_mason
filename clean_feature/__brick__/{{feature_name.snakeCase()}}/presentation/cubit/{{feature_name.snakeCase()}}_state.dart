import 'package:equatable/equatable.dart';

import '../../../../core/ui/widgets/views/view_state.dart';
import '../../../../core/utils/result/result.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/failures/{{feature_name.snakeCase()}}_failure.dart';

sealed class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State();

  ViewState get viewState => switch (this) {
    {{feature_name.pascalCase()}}Initial() => ViewState.initial,
    {{feature_name.pascalCase()}}Loading() => ViewState.loading,
    {{feature_name.pascalCase()}}Success() => ViewState.success,
    {{feature_name.pascalCase()}}Error(failure: final failure) => switch (failure.type) {
      {{feature_name.pascalCase()}}Failure.noConnection => ViewState.errorConnection,
      _ => ViewState.errorServer,
    },
  };

  @override
  List<Object?> get props => [];
}

final class {{feature_name.pascalCase()}}Initial
    extends {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}Initial();
}

final class {{feature_name.pascalCase()}}Loading
    extends {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}Loading();
}

final class {{feature_name.pascalCase()}}Success
    extends {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}Success(this.entity);

  final {{feature_name.pascalCase()}}Entity entity;

  @override
  List<Object?> get props => [entity];
}

final class {{feature_name.pascalCase()}}Error
    extends {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}Error(this.failure);

  final FailureInfo<{{feature_name.pascalCase()}}Failure> failure;

  @override
  List<Object?> get props => [failure.type, failure.message];
}
