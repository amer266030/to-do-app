import 'package:flutter/material.dart';
import 'package:interactions_app/extensions/text_ext.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxLines = 1,
      this.radius = 12});
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: maxLines,
      maxLines: null,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(fontSize: 12.0, height: 1.5),
      decoration: InputDecoration(
        label: Text(hint).styled(size: 12, weight: FontWeight.w400),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
