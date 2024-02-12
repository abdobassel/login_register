part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class BtmNavChange extends HomeState {}

class HomeGetUserDataSuccessState extends HomeState {
  final UserModel model;
  HomeGetUserDataSuccessState(this.model);
}

class HomeGetUserDataLoadingState extends HomeState {}

class HomeGetUserDataErrorState extends HomeState {
  final String error;
  HomeGetUserDataErrorState(this.error);
}

class HomeUpdatesuccessState extends HomeState {}

class HomeUpdateLoadingState extends HomeState {}

class HomeUpdateErrorState extends HomeState {
  final String error;
  HomeUpdateErrorState(this.error);
}

//profile img
//picker
class HomePickImgProfileSuccessState extends HomeState {}

class HomePickImgProfileErrorState extends HomeState {}

// upload
class HomeUploadImgProfileSuccessState extends HomeState {}

class HomeUploadImgProfileErrorState extends HomeState {
  final String error;
  HomeUploadImgProfileErrorState(this.error);
}

class HomeUploadImgProfileLoadingState extends HomeState {}
