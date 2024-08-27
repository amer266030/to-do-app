import 'package:flutter/cupertino.dart';

enum DropDownIcons {
  person,
  circle,
  square,
  home,
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
      case DropDownIcons.home:
        return CupertinoIcons.home;
      default:
        return CupertinoIcons.exclamationmark_circle_fill;
    }
  }
}
