import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLines;

  const CustomTextField({Key? key,
    required this.textEditingController,
    required this.hintText,
    this.maxLines =1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
      hintText: hintText,
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color:  Colors.black
        )
      ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black38
          )
        ),


      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your ${hintText}';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
