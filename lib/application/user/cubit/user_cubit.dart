import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc/domain/core/user/model/user_req_res.dart';
import 'package:flutter_cubit_bloc/domain/core/user/user_data2.dart';
import 'package:flutter_cubit_bloc/infrastructure/user/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());
  UserRepository _userRepository = UserRepository();

  void createNewUser(RequestData requestData) async {
    emit(UserState.loading());

    try {
      final _data = await _userRepository.createNewUser(
          requestData);

      _data.fold(
        (l) => emit(UserState.error(l)),
        (r) => emit(UserState.success(r)),
      );
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
