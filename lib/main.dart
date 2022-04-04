import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloonbooking/observer.dart';
import 'package:saloonbooking/screens/customerRegister/cubit/cubit.dart';
import 'package:saloonbooking/screens/login/LoginScreen.dart';
import 'package:saloonbooking/screens/login/cubit/cubit.dart';
import 'package:saloonbooking/screens/stylistRegister/cubit/cubit.dart';
import 'componants.dart';
import 'layout/layout.dart';
import 'observer.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) => {
    print('firebase initialized successfully')
  }).catchError((error){
    print('firebase initialized error=>${error.toString()}');
  });
  runApp(MyApp(
    saveUser: user,
  ));
  Bloc.observer=MyBlocObserver();
  user=FirebaseAuth.instance.currentUser;

}
class MyApp extends StatelessWidget {
  User?saveUser;
  MyApp({
    required this.saveUser,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => CustomerRegisterCubit(),
        ),
        BlocProvider(
          create: (context) => StylistRegisterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}




