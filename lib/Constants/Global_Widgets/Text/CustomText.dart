import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final int maxLine;
  final Color color;
  final String text;
  final bool bold;
  const CustomText(
      {super.key,
      required this.text,
      required this.color,
      required this.maxLine,
      required this.bold});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : null,
          // fontSize: text60sp,
          color: color,
        ),
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
