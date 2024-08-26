import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, required this.action});
  final String title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: action,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title),
            ),
          ),
        )
      ],
    );
  }
}
