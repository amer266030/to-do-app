import 'package:flutter/material.dart';

extension CustomTextStyle on Text {
  Text styled({
    double size = 18,
    Color color = Colors.black,
    FontWeight weight = FontWeight.bold,
    TextAlign align = TextAlign.start,
    int lineLimit = 1,
  }) {
    return Text(
      data!,
      textAlign: align,
      softWrap: true,
      maxLines: lineLimit,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
