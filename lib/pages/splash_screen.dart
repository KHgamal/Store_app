
import 'dart:async';
import 'package:creativa/pages/login.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}
class MyHomePageState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF274472),
                  const Color(0xFF8a92bd),
                  bgLight
                ],
                begin: Alignment.topCenter,
                end:Alignment.bottomCenter,
                tileMode: TileMode.clamp
            ),
          ),
          child:Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,right: 15 ,left: 15),
                    child: Image.asset('assets/icon.png'),
                  ),
                  const Text("Online ",style: TextStyle(color: Colors.white,
                      fontSize:60),),
                  const Text("Shopping ",style: TextStyle(color: Colors.white,
                      fontSize:60),),
                ],
              ),
            ),
          ),
      ),
    );
  }
}