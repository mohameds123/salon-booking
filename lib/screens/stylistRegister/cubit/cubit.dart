import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:saloonbooking/componants.dart';
import 'package:saloonbooking/screens/stylistRegister/cubit/state.dart';
import '../../../models/userModel.dart';

class StylistRegisterCubit extends Cubit<StylistRegisterState>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController SpecialtyController = TextEditingController();
  StylistRegisterCubit():super(InitialStylistRegisterState());
  LocationData ?_locationData;
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
      latitude: _locationData!.latitude,
      longitude: _locationData!.longitude,
      email: emailController.text,
      password:passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
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
  getLocation(context)
  async{
    emit(GetStylistLocationLoadingsState());
    Location location = Location();
    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    _serviceEnable=await location.serviceEnabled();
    if(!_serviceEnable){
      _serviceEnable=await location.requestService();
      if(!_serviceEnable){
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted=await location.requestPermission();
      if(_permissionGranted != PermissionStatus.denied){
        return;
      }
    }
    _locationData = await location.getLocation();
    emit(GeStylistLocationSuccessState());
  }
}