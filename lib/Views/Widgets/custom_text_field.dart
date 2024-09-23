import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.maxLine = 1,
      this.onSaved,
      this.onChanged,
      this.textEditingController});
  final String title;
  final int maxLine;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff62fcd7),
      style: const TextStyle(color: Color(0xff62fcd7)),
      controller: textEditingController,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        } else {
          return null;
        }
      },
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: title,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff62fcd7))),
      ),
    );
  }
}
