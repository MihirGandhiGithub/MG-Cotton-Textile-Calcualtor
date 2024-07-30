import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButtonSimpleText extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttontext;
  final double height;
  final double width;

  const GlobalButtonSimpleText(
      {super.key,
      required this.onPressed,
      required this.buttontext,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(400.w, 0, 400.w, 0),
      padding: EdgeInsets.only(top: 20.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.blue.shade200,
          // backgroundColor: const Color.fromRGBO(23, 35, 255, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.sp),
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
