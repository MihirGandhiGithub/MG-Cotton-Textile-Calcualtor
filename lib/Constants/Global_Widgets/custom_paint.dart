import 'package:flutter/material.dart';

class CustomDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Paint the top half in blue
    paint.color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height / 2), paint);

    // Paint the bottom half in red
    paint.color = Colors.blue;
    canvas.drawRect(
        Rect.fromLTWH(0, size.height / 2, size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
