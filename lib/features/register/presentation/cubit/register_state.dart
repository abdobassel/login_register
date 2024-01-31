part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ShowPasswordRegisterState extends RegisterState {}

class ShowCharactresCompletedState extends RegisterState {}

class ShowCharactresNotCompletedState extends RegisterState {}

class ShowCharactresHasUppercaseState extends RegisterState {}

class ShowCharactresNotHasUppercaseState extends RegisterState {}

// register only not create data in firestore
class CreateUserSuccessRegister extends RegisterState {}

class CreateUserLoadinRegister extends RegisterState {}

class CreateUserErrorRegister extends RegisterState {
  final String error;
  CreateUserErrorRegister(this.error);
}

// create user firestore database with register
class CreateUserDataLoadingState extends RegisterState {}

class CreateUserDataSuccessState extends RegisterState {}

class CreateUserDataErrorState extends RegisterState {
  final String error;
  CreateUserDataErrorState(this.error);
}
