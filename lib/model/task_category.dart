import 'package:flutter/material.dart';

import 'enum/drop_down_icons.dart';

class TaskCategory {
  int id;
  String title;
  String iconName;
  String colorName;

  IconData get icon =>
      DropDownIcons.values.where((i) => i.name == iconName).first.icon();

  TaskCategory(
      {required this.id,
      required this.title,
      required this.iconName,
      required this.colorName});

  TaskCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        iconName = json['iconName'] as String,
        colorName = json['colorName'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'iconName': iconName,
        'colorName': colorName,
      };
}

extension CategoryColor on TaskCategory {
  MaterialColor color() {
    switch (colorName) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.purple;
    }
  }
}
