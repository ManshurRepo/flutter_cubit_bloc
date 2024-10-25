// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;
  AuthError({
    required this.errorMessage,
  });
}

class AuthLoginSuccess extends AuthState {
  final LoginResponseModel dataLogin;
  AuthLoginSuccess({
    required this.dataLogin,
  });
  
}
