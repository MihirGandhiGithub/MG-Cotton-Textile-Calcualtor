import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:provider/provider.dart';

import '../../../StageManagementClass/provider_state_management.dart';

class GlobalResultBuilderForResults extends StatelessWidget {
  final double result;
  final String substreamtext;
  final String streamtitletext;

  const GlobalResultBuilderForResults(
      {super.key,
      required this.substreamtext,
      required this.streamtitletext,
      required this.result});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          // color: themeProvider.themeMode.name==''?null:null,

          color: themeProvider.themeMode.name == 'Light'
              ? Colors.black
              : Colors.white,

          width: 1.0,
        ),
        // color: Colors.white,
        borderRadius: BorderRadius.circular(50.sp),
        color: themeProvider.themeMode.name == 'Light'
            ? Colors.white
            : Colors.white38,
      ),
      child: Row(
        children: [
          Tooltip(
            message: streamtitletext,
            child: Text(
              streamtitletext,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  // fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeMode.name == 'Light'
                      ? Colors.black
                      : Colors.white),
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              // height: 120.h,
              decoration: BoxDecoration(
                border: Border.all(
                  // color: Colors.black,
                  width: 1.0,
                ),
                color: themeProvider.themeMode.name == 'Light'
                    ? Colors.grey[200]
                    : Colors.grey[400],
                borderRadius: BorderRadius.circular(40.sp),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tooltip(
                  message: '$result' ' $substreamtext',
                  child: GradientText(
                    '$result' ' $substreamtext',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 55.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: const [
                      Colors.black,
                      // Colors.teal,
                      Colors.red,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
