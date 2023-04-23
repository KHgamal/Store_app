import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../pages/login.dart';

class AuthProvider extends ChangeNotifier {
  String profilePicLink = "";
  Future registerEmailPassword(
      {required context,required emailController,required passController,
        required nameController,required image}) async {
    try {
      await uploadPic(context,image);
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(
          email:emailController.text,
          password:passController.text);
      final user =  userCredential.user;
      await user?.updatePhotoURL(profilePicLink);
      await user?.updateDisplayName(nameController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) =>
      const LoginScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The password provided is too weak.")),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(content: Text('The account already exists for that email.')),
        );
      }
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(e.toString())),
      );
    }
    notifyListeners();
  }

  Future uploadPic(BuildContext context,image) async{
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(image.path);
    var storedImage = File(image.path);
    UploadTask uploadTask = ref.putFile(storedImage);
    await uploadTask.then((res) async {
      profilePicLink= await res.ref.getDownloadURL();
    });


  }

}