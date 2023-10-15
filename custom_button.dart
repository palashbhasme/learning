import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.bold
      ),),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50.0),
      ),
    );
  }
}
