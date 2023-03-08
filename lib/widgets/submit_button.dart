import 'package:flutter/material.dart';
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key,required this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffe90001),
      ),
      onPressed: onPressed, child: const Text("submit"),);
  }
}
