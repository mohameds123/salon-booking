import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloonbooking/screens/customerRegister/cubit/state.dart';
import '../../../models/userModel.dart';

class CustomerRegisterCubit extends Cubit<CustomerRegisterState>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  CustomerRegisterCubit():super(InitialRegisterState());
  static CustomerRegisterCubit get(context)=>BlocProvider.of(context);
  void userRegister(){
    emit(LoadingCustomerRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value){
      setCustomerData(
        uId:value.user!.uid,
      );
      emit(CustomerRegisterSuccessState());
    }).catchError((error){
      print('User Authentication Error=>${error.toString()}');
      emit(CustomerRegisterErrorState());
    });
  }
  void setCustomerData({
    required String uId,
  }){
    emit(SetCustomerDataLoadingsState());
    UserModel userModel = UserModel(
      uId: uId,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
    );
    FirebaseFirestore.instance
        .collection('customer')
        .doc(uId)
        .set(userModel.toMap())
        .then((value){
      emit(SetCustomerDataSuccessState());
    }).catchError((error){
      print('set user Error=>${error.toString()}');
      emit(SetCustomerDataErorrState());
    });
  }
}