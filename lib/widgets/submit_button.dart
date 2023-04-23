import 'package:flutter/material.dart';

import '../constants.dart';
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key,required this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        height: 35,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:navBarColor,
          ),
          onPressed: onPressed, child: const Text("submit"),),
      ),
    );
  }
}
