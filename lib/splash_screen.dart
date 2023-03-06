
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:creativa/login.dart';
import 'package:flutter/material.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      // duration: for the screen appearance duration
      duration: 1300,
      splash:ListView(
        children: [
          const Center(child:  Text("Store app",style: TextStyle(color:  Color(0xffe90001),
              fontWeight: FontWeight.bold,fontSize: 50),)),
          SizedBox(height: size.height*0.02,),
          Image.asset('assets/icon.png',width: size.width*0.4,height: size.height*0.4,),

        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      //for the fadeTransition ( splashTransition ) duration
      animationDuration: const Duration(seconds:1),
      backgroundColor:const Color(0xfff1c7b9),
    );
  }
}