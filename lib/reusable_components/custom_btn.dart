import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.title,
    required this.action,
    this.color = Colors.blue,
  });
  final String title;
  final VoidCallback action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: action,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title),
        ),
      ),
    );
  }
}
