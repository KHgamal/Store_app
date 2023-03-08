import 'package:flutter/material.dart';
class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        //if password length is less than 6 print weak password
        if (value == null || value.isEmpty) {
          return 'field is required';
        }
        else if(!value.contains('@')||!value.contains('.')){
          return 'Not valid Email ';
        }
        return null;
      },
      decoration:
      const  InputDecoration(
        suffixIcon:Icon(Icons.email_outlined,color: Colors.white60 ,),
        labelText:"Email",
      ) ,
    );
  }
}
