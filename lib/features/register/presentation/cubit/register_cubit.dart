import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/components.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  bool isPassword = true;

  void showPass() {
    isPassword = !isPassword;

    emit(ShowPasswordRegisterState());
  }

// minimum 8 character password
  bool charactersCompleted = false;

  void countCharacters({required String text}) {
    if (text.length >= 8) {
      charactersCompleted = true;
      emit(ShowCharactresCompletedState());
    } else {
      charactersCompleted = false;
      emit(ShowCharactresNotCompletedState());
    }
  }

// هل يوجد حرف كبير ام لا
// upper Case // my name is Abderrahman Bassel =>  Egypt
  void isTextHaseUpperCase({required String text}) {
    bool hasUpperCase = false;
    bool upperCaseOnly = text.contains(new RegExp(r'[A-Z]'));

    // هنا استخدمت الكود ده عشان الارقام كانت تعامل كانها
    // حرف كبير فبتاكد ان الداخل حرف كبير فقط قبل تغيير الايقونة

    if (upperCaseOnly) {
      for (int i = 0; i < text.length; i++) {
        if (text[i].toUpperCase() == text[i]) {
          //text.contains(RegExp('A-Z'));

          hasUpperCase = true;

          break;
        }
      }
    }

    if (hasUpperCase) {
      emit(ShowCharactresHasUppercaseState());
    } else {
      emit(ShowCharactresNotHasUppercaseState());
    }
  }

// Create User firbase Auth

  Future<void> createUserAuth(
      {required String email, required String password}) async {
    emit(CreateUserLoadinRegister());
    try {
      var auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      ShowToast(text: 'Success Register', state: ToastStates.SUCCESS);
      emit(CreateUserSuccessRegister());
      print(auth.user!.email);
      print(auth.user!.uid);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "weak-password":
          ShowToast(text: 'Weak password!', state: ToastStates.WARNING);

          break;
        case "email-already-in-use":
          ShowToast(text: 'Email already Exists!', state: ToastStates.ERROR);
          break;
        default:
          print("Unkown error.");
      }
      emit(CreateUserErrorRegister(e.code));
    }
  }
}
