import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_request_model.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_response_model.dart';
import 'package:flutter_cubit_bloc/infrastructure/auth/auth_repository.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_cubit_bloc/utils/constant.dart' as constant;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequestModel loginRequestModel) async {
    emit(AuthLoading());

    try {
      final _data = await _authRepository.signInUserWithEmailAndPassword(
          loginRequestModel: loginRequestModel);

      _data.fold(
        (l) => emit(AuthError(errorMessage: (l))),
        (r) => emit(AuthLoginSuccess(dataLogin: (r))),
      );
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  void saveUserToLocal(LoginResponseModel data) async {
    emit(AuthLoading());

    try {
      await GetStorage().write(constant.userLocalKey, jsonEncode(data));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  void LoadUserFromLocal() async {
    emit(AuthLoading());
    try {
      final _data = await GetStorage().read(constant.userLocalKey);
      final _result = LoginResponseModel.fromJson(jsonDecode(_data));
      emit(AuthLoginSuccess(dataLogin: _result));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
