import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.width,
    required this.height,
    required this.color, required this.text,
  });

  final double width;
  final double height;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          minimumSize: MaterialStatePropertyAll(Size(width, height))),
      onPressed: () async {},
      child:  Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
