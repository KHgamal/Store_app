import 'package:flutter/material.dart';
class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        //if password length is less than 6 print weak password
        if (value == null || value.isEmpty) {
          return 'field is required';
        }
        else if(value.length<6){
          return 'weak password ';
        }
        return null;
      },
      decoration:
      const  InputDecoration(
        labelText:"password",
        suffixIcon:Icon(Icons.lock_outline,color: Colors.white60 ,),

      ) ,
      obscureText: true,
    );
  }
}
