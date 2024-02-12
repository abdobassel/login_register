import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/core/constants.dart';
import 'package:project/features/home/presentation/screens/add_image.dart';
import 'package:project/features/home/presentation/screens/add_task.dart';
import 'package:project/features/home/presentation/screens/images_screen.dart';
import 'package:project/features/home/presentation/screens/profile_screen.dart';
import 'package:project/features/home/presentation/screens/tasks.dart';
import 'package:project/features/register/data/models/user_create_model.dart';
//https://img.freepik.com/free-photo/3d-portrait-businessman_23-2150793879.jpg?t=st=1707724789~exp=1707728389~hmac=d3de0370fa451ff24fd4d47ab2fe46269737da2e64c45b9618012e2f4a2c181f&w=360

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const ImagesScreen(),
    const AddImgScreen(),
    const TaskScreen(),
    const AddTaskScreen(),
    ProfileScreen(),
  ];
  List<String> titles = [
    'My Images',
    'Add Image',
    'Tasks',
    'Add Task',
    'Settings',
  ];
  void changeBtmNavBar(int index) {
    if (index == 0) {
      getUserData();
    }
    currentIndex = index;
    emit(BtmNavChange());
  }

  // get users data
  late UserModel model;
  void getUserData() async {
    emit(HomeGetUserDataLoadingState());

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      model = UserModel.fromJson(value.data()!);
      print(value.data().toString());
      print(model.email);
      emit(HomeGetUserDataSuccessState(model));
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserDataErrorState(error.toString()));
    });
  }
// profile

  void updateProfile({required String name, String? image}) async {
    emit(HomeUpdateLoadingState());
    UserModel userUpdated = UserModel(
      name: name,
      email: model.email,
      img: image ?? model.img,
      userId: model.userId,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(userUpdated.toMap())
        .then((value) {
      getUserData();

      emit(HomeUpdatesuccessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(HomeUpdateErrorState(erorr.toString()));
    });
  }

  var picker = ImagePicker();

  File? profileImage;
  Future<void> getImgProfile() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(HomePickImgProfileSuccessState());
    } else {
      print('no img selected');
      emit(HomePickImgProfileErrorState());
    }
  }

  //upload profile
  void uploadProfileImage({
    required String name,
  }) {
    emit(HomeUploadImgProfileLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'profileImages/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //
        updateProfile(
          name: name,
          image: value,
        );
        print(value);
      }).catchError((erorr) {
        print(erorr.toString());
        emit(HomeUploadImgProfileErrorState(erorr.toString()));
      });
    }).catchError((erorr) {
      print(erorr.toString());
      emit(HomeUploadImgProfileErrorState(erorr.toString()));
    });
  }

// tasks

// images upload

// images get
}
