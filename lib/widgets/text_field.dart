import 'package:flutter/material.dart';

import '../constants.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, required this.text,
    required this.icon,this.obscureText}) : super(key: key);
  final String text;
  final bool? obscureText;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText==null?false:true,
      controller: controller,
      validator: (value) {
        //if password length is less than 6 print weak password
        if (value == null || value.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      decoration:
        InputDecoration(
        prefixIcon:Icon(icon),
        labelText:text,
      ) ,
    );
  }
}
