import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
