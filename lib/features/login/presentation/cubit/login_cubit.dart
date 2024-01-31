import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/components.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  void showPass() {
    isPassword = !isPassword;

    emit(ShowPasswordState());
  }

  // login method firbase
  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginUserLoadinLoginState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(email);
      String uid = FirebaseAuth.instance.currentUser!.uid;
      emit(LoginUserSuccessLoginState());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-credential":
          ShowToast(text: 'Wrong password!', state: ToastStates.ERROR);

          break;
        case "invalid-email":
          ShowToast(text: 'invalid email', state: ToastStates.ERROR);
          break;
        default:
          print("Unkown error.");
      }
      print(e.toString());
      emit(LoginUserErrorLoginState(e.code));
    }
  }
}
