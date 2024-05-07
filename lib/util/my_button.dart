import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: Colors.amber,
      color: Colors.grey.shade200,
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
