import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCategory {
  int id;
  String title;
  IconData iconData;
  Color color;

  TaskCategory(
      {required this.id,
      required this.title,
      required this.iconData,
      required this.color});
}
