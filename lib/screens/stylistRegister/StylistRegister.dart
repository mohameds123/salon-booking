import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saloonbooking/screens/stylistRegister/cubit/cubit.dart';
import 'package:saloonbooking/screens/stylistRegister/cubit/state.dart';
import '../../componants.dart';
import '../login/LoginScreen.dart';
class StylistRegister extends StatelessWidget {
  var form_key = GlobalKey<FormState>();
  StylistRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StylistRegisterCubit,StylistRegisterState>(
      listener: (context,state){
        if (state is StylistRegisterSuccessState) {
          navigateAndFinish(
            context: context,
            widget: LoginScreen(),
          );
        }
      },
      builder: (context,state)=>Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: form_key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: TextLiquidFill(
                    text: 'Register',
                    waveColor: HexColor('AC8027'),
                    boxBackgroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                    boxHeight: 85.0,
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('fdf8f5'),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: StylistRegisterCubit.get(context).nameController,
                      cursorColor: Colors.grey,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: (
                            '  Name'
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('#fdf9f5'),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: StylistRegisterCubit.get(context).emailController,
                      cursorColor: Colors.grey,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: (
                            '  E-mail'
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,

                          ),
                        ),
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:HexColor('#fdf9f5'),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: StylistRegisterCubit.get(context).passwordController,
                      cursorColor: Colors.grey,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: (
                            '  Password'
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#fdf9f5'),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: StylistRegisterCubit.get(context).phoneController,

                      cursorColor: Colors.grey,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: (
                            '  Phone'
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: HexColor('fdf8f5'),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        StylistRegisterCubit.get(context).getLocation(context);
                      },
                      child: Text(' Location'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('fdf8f5'),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: StylistRegisterCubit.get(context).SpecialtyController,

                      cursorColor: Colors.grey,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: (
                            '  Your Specialty'
                        ),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,

                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: (){
                    if(form_key.currentState!.validate()){
                      StylistRegisterCubit.get(context).stylistRegister();
                    }
                  },
                  clipBehavior: Clip.none,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black
                    ),
                    child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
