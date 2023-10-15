import 'package:flutter/material.dart';

class AgeField extends StatefulWidget {
  AgeField({Key? key, required this.age, required this.onTap})
      : super(key: key);
   int age;
  final VoidCallback onTap;

  @override
  State<AgeField> createState() => _AgeFieldState();
}

class _AgeFieldState extends State<AgeField> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.age}",
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
