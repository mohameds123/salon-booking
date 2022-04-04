import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saloonbooking/screens/customerRegister/CustomerRegister.dart';
import 'package:saloonbooking/screens/stylistRegister/StylistRegister.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: DefaultTextStyle(
          style:  TextStyle(
            color: Colors.black,
             fontSize: 40.0,
            fontWeight: FontWeight.w200
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Register as',

              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
    ),
        ),
          SizedBox(
            height: 200,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: MaterialButton(
                    clipBehavior: Clip.none,
                    splashColor: HexColor('AC8027'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StylistRegister(),
                        ),
                      );
                    },
                    color: Colors.black,
                    height: 70,
                    minWidth: 150,
                    child: Center(
                        child: Text(
                      'Stylist',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: MaterialButton(
                    clipBehavior: Clip.none,
                    splashColor: HexColor('AC8027'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerRegister(),
                        ),
                      );
                    },
                    color: Colors.black,
                    height: 70,
                    minWidth: 150,
                    child: Center(
                        child: Text(
                      'Customer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
              ]),
        ]),
      ),
    );
  }
}
