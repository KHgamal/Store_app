
import 'package:creativa/splash_screen.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return  MaterialApp(
     theme: ThemeData(
       primarySwatch: Colors.blue,
       inputDecorationTheme:  InputDecorationTheme(
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
           borderSide: const BorderSide( color: Colors.white60),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
           borderSide: const BorderSide( color: Color(0xffe90001)),
         ),
         labelStyle: const TextStyle(color: Colors.white60),
       ),

     ),
        debugShowCheckedModeBanner: false,
        home:const CustomSplashScreen(),
    );
  }
}

