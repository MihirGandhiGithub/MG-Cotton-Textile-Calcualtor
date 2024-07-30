import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Global_Variables/colors/colors.dart';

class SCCExpanstionList extends StatefulWidget {
  final String one;
  final String two;
  final String three;
  final String four;

  const SCCExpanstionList(
      {super.key,
      required this.one,
      required this.two,
      required this.three,
      required this.four});

  @override
  State<SCCExpanstionList> createState() => _SCCExpanstionListState();
}

class _SCCExpanstionListState extends State<SCCExpanstionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: universalGray,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 350.w,
            child: Text(
              widget.one,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 50.sp,

                // color: Colors.black
              ),
            ),
          ),
          SizedBox(
            width: 350.w,
            child: Text(
              widget.two,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 50.sp,
                // color: Colors.black
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 65.w),
            width: 300.w,
            child: Text(
              widget.three,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 50.sp,

                // color: Colors.black
              ),
            ),
          ),
          Text(
            widget.four,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 50.sp,

              // color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}

class SSCExpanstionListWith5Field extends StatefulWidget {
  final String one;
  final String two;
  final String three;
  final String four;
  final String five;
  const SSCExpanstionListWith5Field(
      {super.key,
      required this.one,
      required this.two,
      required this.three,
      required this.four,
      required this.five});

  @override
  State<SSCExpanstionListWith5Field> createState() =>
      _SSCExpanstionListWith5FieldState();
}

class _SSCExpanstionListWith5FieldState
    extends State<SSCExpanstionListWith5Field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: universalGray,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: 350.w,
            child: Text(
              widget.one,
              maxLines: 3,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
            ),
          ),
          SizedBox(
            // width: 350.w,
            child: Text(
              widget.two,
              maxLines: 3,
              style: TextStyle(fontSize: 55.sp, color: Colors.black),
            ),
          ),
          Text(
            widget.three,
            maxLines: 3,
            style: TextStyle(fontSize: 60.sp, color: Colors.black),
          ),
          Text(
            widget.four,
            maxLines: 3,
            style: TextStyle(fontSize: 60.sp, color: Colors.black),
          ),
          Text(
            widget.five,
            maxLines: 3,
            style: TextStyle(fontSize: 60.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
