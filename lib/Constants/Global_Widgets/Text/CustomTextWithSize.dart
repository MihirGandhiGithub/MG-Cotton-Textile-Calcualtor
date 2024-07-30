import 'package:flutter/material.dart';

class CustomTextWithSize extends StatelessWidget {
  final int maxLine;
  final Color color;
  final String text;
  final bool bold;
  final double size;
  const CustomTextWithSize(
      {super.key,
      required this.text,
      required this.color,
      required this.maxLine,
      required this.bold,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : null,
          fontSize: size,
          color: color,
        ),
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
