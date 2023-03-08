import 'package:creativa/pages/home_page.dart';
import 'package:creativa/widgets/background_image.dart';
import 'package:creativa/widgets/email_text_field.dart';
import 'package:creativa/widgets/password_text_field.dart';
import 'package:creativa/widgets/submit_button.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body:
          Stack(
            children : [
              const BackGroundImage(),
              SingleChildScrollView(
                child: Form(
                  key:formKey,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.08,),
                        const Text("Log In",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60),),
                        SizedBox(height: size.height*0.05,),
                        //Email Text Field
                        SizedBox(
                          width: size.width*0.8,
                          child: EmailTextField(controller :controller),
                        ),
                        SizedBox(height: size.height*0.03,),
                        ////Password Text Field
                        SizedBox(
                          width:size.width*0.8,
                          child:const PasswordTextField(),
                        ),
                        SizedBox(height: size.height*0.02,),
                        SubmitButton(onPressed: ()=> formKey.currentState!.validate()?
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) =>  HomePage(user:controller.text))):
                        ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(content: Text("Login failed")),
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ]
          )

      ),

    );
  }
}

