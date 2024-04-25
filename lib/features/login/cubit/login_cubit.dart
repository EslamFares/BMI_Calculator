import 'package:bmi/features/login/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  //==========
  signIn() async {
    emit(LoginLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      emit(LoginSucess());
      debugPrint('userCredential: ${userCredential.user!.uid}');
      debugPrint('userCredential: $userCredential');
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: "wrong in login as anonymous"));
      debugPrint('error anonymous: $e');
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
      debugPrint('error : $e');
    }
  }
}
