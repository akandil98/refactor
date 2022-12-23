import 'package:equatable/equatable.dart';
import 'package:refactor/core/utils/app_strings.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

String mapFailureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailure;
    case CacheFailure:
      return AppStrings.cacheFailure;

    default:
      return AppStrings.unexpectedError;
  }
}
