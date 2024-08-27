import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DropDownIcons {
  person,
  circle,
  square,
}

extension IconValue on DropDownIcons {
  IconData icon() {
    switch (this) {
      case DropDownIcons.person:
        return CupertinoIcons.person_fill;
      case DropDownIcons.circle:
        return CupertinoIcons.circle_fill;
      case DropDownIcons.square:
        return CupertinoIcons.square;
    }
  }
}
