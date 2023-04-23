import 'package:creativa/constants.dart';
import 'package:creativa/main.dart';
import 'package:creativa/pages/register.dart';
import 'package:creativa/widgets/outer_container.dart';
import 'package:creativa/widgets/text_field.dart';
import 'package:creativa/widgets/submit_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  Future signInEmailPassword() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
    }
    exceptionRegister(e,context){
      if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(content: Text('No user found for that email.')),
      );
      } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(content: Text('Wrong password provided.')),
      );
      }

    }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:bgLight,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            OuterContainer(size: size,title:"Log In",subTitle:"Welcome back , discover what's new",),
            Center(
              child: Container(width: 320,
                padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                margin: const EdgeInsets.only(top:125,),
                //height:350,
                decoration:const BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ) ,
                child: Form(
                  key:formKey,
                  child: Column(
                    children: [

                      CustomTextField(
                          controller :emailController, text:"Email", icon:Icons.email,),
                      SizedBox(height: size.height*0.03,),
                      ////Password Text Field
                      CustomTextField(
                        obscureText: true,
                        controller :passController, text:"Password", icon:Icons.lock,),
                      SizedBox(height: size.height*0.02,),
                      SubmitButton(onPressed: () async {
                        if(formKey.currentState!.validate()){
                         try{
                          await signInEmailPassword();
                           Provider.of<ProductProvider>(context,listen: false).getProducts();
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) =>
                           const Root()));
                         }
                         on FirebaseAuthException catch (e){
                           exceptionRegister(e, context);
                         }
                         catch(e){
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text(e.toString())),
                           );
                         }
                          }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(content: Text("Login failed")),
                          );}
                      }),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const Text('Don\'t have an account ?',style: TextStyle(fontSize:20),),
                            TextButton(onPressed:()=>Navigator.of(context).pushReplacement
                              (MaterialPageRoute(builder:(context) =>const SignUp())),
                                child:Text("Sign Up",style:TextStyle(fontSize:25,color:categoriesColor),))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

