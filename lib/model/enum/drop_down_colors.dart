import 'package:flutter/material.dart';

enum DropDownColors { red, green, blue }

extension ColorValue on DropDownColors {
  Color color() {
    switch (this) {
      case DropDownColors.red:
        return Colors.red;
      case DropDownColors.green:
        return Colors.green;
      case DropDownColors.blue:
        return Colors.blue;
    }
  }
}
