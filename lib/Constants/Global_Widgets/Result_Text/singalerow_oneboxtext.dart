import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpinningAnswer extends StatelessWidget {
  final double stream;
  final String title;
  final String subtext;

  const SpinningAnswer({
    Key? key,
    required this.stream,
    required this.title,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Title
          Container(
            margin: EdgeInsets.only(left: 80.w),
            width: 450.w,
            child: Tooltip(
              message: title,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),

          //Text field
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                alignment: Alignment.center,
                height: 120.h,
                width: 500.w,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 1.0,
                  // ),
                  // boxShadow: [BoxShadow(blurRadius: 50)],
                  color: Colors.grey,
                  gradient: const LinearGradient(
                      colors: [Colors.black54, Colors.blueGrey]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Tooltip(
                  message: '$stream',
                  child: Text(
                    '$stream',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),

              SizedBox(
                width: 20.sp,
              ),
              //sub text
              SizedBox(
                width: 230.w,
                child: Text(
                  subtext,
                  style: TextStyle(color: Colors.black, fontSize: 30.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
