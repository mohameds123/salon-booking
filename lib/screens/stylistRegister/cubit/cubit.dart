import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloonbooking/screens/stylistRegister/cubit/state.dart';
import '../../../models/userModel.dart';

class StylistRegisterCubit extends Cubit<StylistRegisterState>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController SpecialtyController = TextEditingController();
  StylistRegisterCubit():super(InitialStylistRegisterState());
  static StylistRegisterCubit get(context)=>BlocProvider.of(context);
  void stylistRegister(){
    emit(LoadingStylistRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value){
      setData(
        uId:value.user!.uid,
      );
      emit(StylistRegisterSuccessState());
    }).catchError((error){
      print('User Authentication Error=>${error.toString()}');
      emit(StylistRegisterErrorState());
    });
  }
  void setData({
    required String uId,
  }){
    emit(SetStylistDataLoadingsState());
    UserModel usermodel = UserModel(
      uId: uId,
      email: emailController.text,
      password: phoneController.text,
      name: nameController.text,
      phone: phoneController.text,
      location: locationController.text,
      Specialty: SpecialtyController.text,
    );
    FirebaseFirestore.instance
        .collection('stylist')
        .doc(uId)
        .set(usermodel.toMap())
        .then((value){
      emit(SetStylistDataSuccessState());
    }).catchError((error){
      print('set user Error=>${error.toString()}');
      emit(SetStylistDataErorrState());
    });
  }
}