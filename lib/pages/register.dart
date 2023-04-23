import 'dart:io';

import 'package:creativa/providers/auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../widgets/outer_container.dart';
import '../widgets/text_field.dart';
import '../widgets/submit_button.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  File? image;


  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffE1EAF3),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            OuterContainer(size: size,title: "Sign Up",subTitle:"Sign Up to save your categories and favourites",),
            Center(child:  Container(
                width: 320,
                padding:const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top:125,),
                decoration:const BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ) ,
                child: SingleChildScrollView(child: Form(
                  key:formKey,
                  child: Column(
                    children: [
                       Center(child:
                    image==null? CircleAvatar(
                     backgroundColor: Colors.black26,
                       radius:30,
                       child:IconButton(onPressed: ()=>pickImage(), icon: const
                       Icon(Icons.person_add_alt_1_sharp,color: Colors.white,size:35,))
                          ,
                     ):CircleAvatar(
                         radius:30,
                         backgroundImage: FileImage(image!),
                       ),),
                      const SizedBox(height: 13,),
                      CustomTextField(
                        controller :nameController, text:"Name", icon:Icons.person,),
                      const SizedBox(height: 15,),
                      CustomTextField(
                        controller :emailController, text:"Email", icon:Icons.email,),
                      const SizedBox(height: 15,),
                      CustomTextField(
                        obscureText: true,
                        controller :passController, text:"Password", icon:Icons.lock,),
                      const SizedBox(height: 15,),
                      SubmitButton(onPressed: ()async{
                      if(formKey.currentState!.validate()){
                        await Provider.of<AuthProvider>(context,listen:false).
                     registerEmailPassword(image:image,context: context,nameController: nameController
                          ,emailController:emailController,passController: passController );
                     }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(content: Text("Sign up failed")),
                      );}
                      }),

                    ],
                  ),
                ),)
            ),),

          ],
        ),
      ),
    );
  }
}