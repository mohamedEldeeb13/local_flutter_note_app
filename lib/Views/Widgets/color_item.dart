import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.isActive, required this.backgroundColor});
  final bool isActive;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 31,
              backgroundColor: backgroundColor,
            ),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: backgroundColor,
          );
  }
}
