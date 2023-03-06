import 'package:creativa/home_page.dart';
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
              Container(decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),),
              SingleChildScrollView(
                child: Form(
                  key:formKey,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.08,),
                        const Text("Log In",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60),),
                        SizedBox(height: size.height*0.05,),
                        SizedBox(
                          width: size.width*0.8,
                          child: TextFormField(
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
                          ),
                        ),
                        SizedBox(height: size.height*0.03,),
                        SizedBox(
                          width:size.width*0.8,
                          child: TextFormField(
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
                          ),
                        ),
                        SizedBox(height: size.height*0.02,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffe90001),
                            ),
                            onPressed: () {
                          formKey.currentState!.validate()?
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) =>  HomePage(user:controller.text))):
                          ScaffoldMessenger.of(context).showSnackBar(
                            const  SnackBar(content: Text("Login failed")),
                          );
                        }, child: const Text("submit"),),
                        TextButton(onPressed: (){}, child:  const Text("Forget password ?",style: TextStyle(color:Colors.white60),))
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

