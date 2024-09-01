import 'package:flutter/material.dart';
import 'package:note_app/core/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.bgColor,
    required this.hintText,
    required this.controller,
    required this.maxLines,
    required this.fontSize,
    required this.text,  this.enable=true,
  });

  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final double fontSize;
  final Color bgColor;
  final String text;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: controller,enabled: enable,
            cursorColor: bgColor,
            style: TextStyle(color: Colors.black, fontSize: fontSize),
            maxLines: maxLines,
            decoration: InputDecoration.collapsed(
              hintStyle: TextStyle(color: bgColor, fontSize: fontSize),
              hintText: hintText,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return Constants.validateMessage + text;
              }
              return null;
            },
          ),
        ));
  }
}
