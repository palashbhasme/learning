import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({Key? key, required this.iconData, required this.onTap})
      : super(key: key);
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2),
          color: Colors.black87,
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Transform.scale(
              scale: 2.0, // Adjust the scale factor as needed
              child: Icon(
                iconData,
                size: 14.0, // Adjust the size of the icon as needed
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
