import 'package:flutter/material.dart';
class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bg.jpg"),
        fit: BoxFit.cover,
      ),
    ),);
  }
}
