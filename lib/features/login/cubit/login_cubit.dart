import 'package:bmi/features/login/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cash/getstorage_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  //==========
  signIn() async {
    emit(LoginLoading());
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      GetStorageHelper.writeData('isLogined', true);
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: "wrong in login as anonymous $e"));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
