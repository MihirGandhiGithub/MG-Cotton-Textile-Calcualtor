// with onchaged method
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../StageManagementClass/provider_state_management.dart';

class GlobalRowWidgetWithOnchanged extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String subtitle;
  final double height;
  final double width;
  final Function(String)? onchaned;

  const GlobalRowWidgetWithOnchanged({
    super.key,
    required this.title,
    required this.controller,
    required this.subtitle,
    required this.height,
    required this.width,
    required this.onchaned,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: 5.0, left: 140.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          SizedBox(
            width: 500.w,
            child: Tooltip(
              message: title,
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.black,
                  // fontSize: 45.sp,
                ),
              ),
            ),
          ),

          //Text field
          Expanded(
            child: SizedBox(
              width: 800.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 430.w,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: controller,
                      onChanged: onchaned,
                      // cursorColor: Colors.black,
                      // cursorHeight: 60.sp,
                      // style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: themeProvider.themeMode.name == 'Light'
                            ? Colors.white
                            : Colors
                                .white10, // Set your desired background color here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Set the circular border radius here
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 30.sp),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(9),
                      ],
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                  ),

                  SizedBox(
                    width: 10.w,
                  ),
                  //sub text
                  SizedBox(
                    width: 350.w,
                    child: Tooltip(
                      message: subtitle,
                      child: Text(
                        subtitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 45.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowWidgetWithOnchangedForCurency extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String subtitle;
  final double height;
  final double width;
  final Function(String)? onchaned;

  const GlobalRowWidgetWithOnchangedForCurency({
    super.key,
    required this.title,
    required this.controller,
    required this.subtitle,
    required this.height,
    required this.width,
    required this.onchaned,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            margin: EdgeInsets.only(left: 80.w),
            child: Tooltip(
              message: title,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.black,
                  fontSize: 45.sp,
                ),
              ),
            ),
          ),

          //Text field
          Container(
            margin: EdgeInsets.only(right: 80.w),
            height: 120.h,
            width: 400.w,
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller,
              onChanged: onchaned,
              // cursorColor: Colors.black,
              // cursorHeight: 60.sp,
              style: TextStyle(
                fontSize: 60.sp,
                // color: Colors.black
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.themeMode.name == 'Light'
                    ? Colors.white
                    : Colors.white10, // Set your desired background color here
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      70.sp), // Set the circular border radius here
                  borderSide: BorderSide(
                    // color: Colors.black,
                    width: 5.sp,
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 30.sp),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(7),
              ],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),
        ],
      ),
    );
  }
}
