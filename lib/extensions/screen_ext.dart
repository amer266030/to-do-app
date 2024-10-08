import 'package:flutter/material.dart';

extension Screen on BuildContext {
  getWidth({double divide = 1}) => MediaQuery.of(this).size.width / divide;
  getHeight({double divide = 1}) => MediaQuery.of(this).size.height / divide;
}
