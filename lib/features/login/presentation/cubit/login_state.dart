part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

// 1 Show password or hide

class ShowPasswordState extends LoginState {}

class LoginUserSuccessLoginState extends LoginState {}

class LoginUserLoadinLoginState extends LoginState {}

class LoginUserErrorLoginState extends LoginState {
  final String error;
  LoginUserErrorLoginState(this.error);
}
