import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/settings/domain/usecases/get_user.dart';
import 'package:refactor/features/settings/domain/usecases/update_user.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetUser getUser;
  final UpdateUser updateUser;
  SettingsCubit({
    required this.getUser,
    required this.updateUser,
  }) : super(SettingsInitial());

  //get user data
  UserData? userData;
  Future<void> getUserData() async {
    emit(SettingsIsLoading());
    Either<Failure, UserEntity> response = await getUser(NoParams());

    response.fold(
      (failure) => emit(SettingsError(msg: mapFailureToMsg(failure))),
      (userEntity) {
        userData = userEntity.data;
        emit(SettingsLoaded(userEntity: userEntity));
      },
    );
  }

  Future<void> updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(SettingsIsLoading());
    Either<Failure, UserEntity> response = await updateUser(UpdateUserParams(
      name: name,
      email: email,
      phone: phone,
    ));

    response.fold(
      (failure) => emit(SettingsError(msg: mapFailureToMsg(failure))),
      (userEntity) {
        userData = userEntity.data;
        emit(SettingsLoaded(userEntity: userEntity));
      },
    );
  }
}
