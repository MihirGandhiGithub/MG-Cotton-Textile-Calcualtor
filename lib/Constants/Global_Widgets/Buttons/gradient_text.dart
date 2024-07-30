import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GlobalButtonGradientText extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttontext;
  final double height;
  final double width;

  const GlobalButtonGradientText(
      {super.key,
      required this.onPressed,
      required this.buttontext,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(300.w, 0, 300.w, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: const Color.fromRGBO(0, 13, 255, 1.0),
          // backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.sp),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 60.sp,
            // color: Colors.white
          ),
        ),
      ),
    );
  }
}
