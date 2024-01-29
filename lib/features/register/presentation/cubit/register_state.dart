part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ShowPasswordRegisterState extends RegisterState {}

class ShowCharactresCompletedState extends RegisterState {}

class ShowCharactresNotCompletedState extends RegisterState {}

class ShowCharactresHasUppercaseState extends RegisterState {}

class ShowCharactresNotHasUppercaseState extends RegisterState {}
