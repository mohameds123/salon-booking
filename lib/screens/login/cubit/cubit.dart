
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloonbooking/layout/CustomerLayout.dart';
import 'package:saloonbooking/screens/login/cubit/states.dart';

import '../../../componants.dart';
import '../../../layout/StylistLayout.dart';

class LoginCubit extends Cubit<LoginState>{
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginCubit():super(InitialState());

  void Login(BuildContext context){
    emit(PublicLoginLoadingState());
    if(state is LoginSuccessState) {
      userLogin();
      navigateAndFinish(
        context: context,
        widget: StylistLayOut(),
      );
    }else if(state is CustomerLoginSuccessState){
      navigateAndFinish(
        context: context,
        widget: CustomerLayOut(),
      );
      CustomerLogin();
    }
    emit(PublicLoginSuccessState());
  }

  void userLogin(){
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password:passwordController.text,
    ).then((value){
      emit(LoginSuccessState());
    }).catchError((error){
      print('user Authentication Error=>${error.toString()}');
      emit(LoginErrorState());
    });
  }

  void CustomerLogin(){
    emit(CustomerLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password:passwordController.text,
    ).then((value){
      emit(CustomerLoginSuccessState());
    }).catchError((error){
      print('user Authentication Error=>${error.toString()}');
      emit(CustomerLoginErrorState());
    });
  }
}