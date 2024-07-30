import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:provider/provider.dart';

import '../../StageManagementClass/provider_state_management.dart';

class GlobalRowCompareWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String subtitle;
  final double height;
  final double width;

  const GlobalRowCompareWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.subtitle,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          SizedBox(
            width: 500.w,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),

          //Text field 1
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 5.sp,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70.sp),
            ),
            child: TextField(
              // textAlign: TextAlign.center,
              maxLines: 1,
              textAlign: TextAlign.left,
              controller: controller,
              cursorColor: Colors.black,
              cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                // fillColor: Colors.red,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(70.sp)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2textfiels extends StatelessWidget {
  final String title;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String subtitle;
  final double height;
  final double width;

  const GlobalRowCompareWidget2textfiels({
    super.key,
    required this.title,
    required this.controller1,
    required this.subtitle,
    required this.height,
    required this.width,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          SizedBox(
            width: 500.w,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),

          //Text field 1
          Container(
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 5.sp,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70.sp),
            ),
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller1,
              cursorColor: Colors.black,
              cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20.sp, 10.sp, 0, 55.sp),
                // contentPadding: EdgeInsets.symmetric(
                //   vertical: 43.h,
                // ), // Adjust the vertical padding
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(7),
              ],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),

          //Text field 2
          Container(
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 5.sp,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70.sp),
            ),
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller2,
              cursorColor: Colors.black,
              cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20.sp, 10.sp, 0, 55.sp),
                // contentPadding: EdgeInsets.symmetric(
                //   vertical: 43.h,
                // ), // Adjust the vertical padding
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
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

class GlobalRowCompareWidget2textfielsWithOnchanges extends StatelessWidget {
  final String title;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String subtitle;
  final double height;
  final double width;
  final Function(String)? onchaned1;
  final Function(String)? onchane2;

  const GlobalRowCompareWidget2textfielsWithOnchanges({
    super.key,
    required this.title,
    required this.controller1,
    required this.subtitle,
    required this.height,
    required this.width,
    required this.controller2,
    required this.onchaned1,
    required this.onchane2,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          SizedBox(
            width: 420.w,
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

          //Text field 1
          SizedBox(
            height: 120.h,
            width: 450.w,
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller1,
              onChanged: onchaned1,
              // cursorColor: Colors.black,
              // cursorHeight: 60.sp,
              // style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                hintText: subtitle,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  // fontSize: 40.sp,
                ),
                filled: true,
                fillColor: themeProvider.themeMode.name == 'Light'
                    ? Colors.white
                    : Colors.white10,
                // Set your desired background color here
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      50.sp), // Set the circular border radius here
                  borderSide: BorderSide(
                    // color: Colors.black,
                    width: 5.sp,
                  ),
                ),

                contentPadding: EdgeInsets.only(left: 30.sp),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
              ],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),

          //Text field 2
          SizedBox(
            height: 120.h,
            width: 450.w,
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller2,
              onChanged: onchane2,
              // cursorColor: Colors.black,
              // cursorHeight: 60.sp,
              // style: TextStyle(
              //     fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                hintText: subtitle,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  // fontSize: 40.sp,
                ),
                filled: true,
                fillColor: themeProvider.themeMode.name == 'Light'
                    ? Colors.white
                    : Colors.white10,
                // Set your desired background color here
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      50.sp), // Set the circular border radius here
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5.sp,
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  left: 30.sp,
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
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

class GlobalRowCompareWidget2TEXT extends StatelessWidget {
  final String title1;
  final String title2;

  const GlobalRowCompareWidget2TEXT(
      {super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 400.w,
          ),

          //Text field 1
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            alignment: Alignment.center,
            height: 120.h,
            width: 450.w,
            child: Text(
              title1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),

          //Text field 2
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            alignment: Alignment.center,
            height: 120.h,
            width: 450.w,
            child: Text(
              title2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2Button extends StatelessWidget {
  final VoidCallback onpressed1;
  final VoidCallback onpressed2;
  final String text1;
  final String text2;

  const GlobalRowCompareWidget2Button(
      {super.key,
      required this.onpressed1,
      required this.onpressed2,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 400.w,
          ),

          //Text field 1

          Container(
            height: 120.h,
            width: 450.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.white38,
            ),
            child: ElevatedButton(
              onPressed: onpressed1,
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          //Text field 2
          Container(
            height: 120.h,
            width: 450.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.white38,
            ),
            child: ElevatedButton(
              onPressed: onpressed2,
              child: Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2StreamBuilder extends StatelessWidget {
  final Stream<double> stream1;
  final Stream<double> stream2;
  final String title1;
  final String title2;
  final String subtext1;
  final String subtext2;

  const GlobalRowCompareWidget2StreamBuilder(
      {super.key,
      required this.stream1,
      required this.stream2,
      required this.subtext1,
      required this.subtext2,
      required this.title1,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          SizedBox(
            width: 500.w,
            child: Text(
              title1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),

          //Text field 1
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 110.h,
            width: 400.w,
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
            child: StreamBuilder<double>(
              stream: stream1,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasData) {
                  return Tooltip(
                    message: '${snapshot.data}' ' $subtext1',
                    child: Text(
                      '${snapshot.data}' ' $subtext1',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 60.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return const Text('0');
                }
              },
            ),
          ),

          //Text field 2
          Container(
            padding: EdgeInsets.fromLTRB(0.w, 0, 0, 0),
            alignment: Alignment.center,
            height: 110.h,
            width: 400.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              gradient: const LinearGradient(
                  colors: [Colors.black54, Colors.blueGrey]),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: StreamBuilder<double>(
              stream: stream2,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot2) {
                if (snapshot2.hasData) {
                  return Tooltip(
                    message: '${snapshot2.data}' ' $subtext2',
                    child: Text(
                      '${snapshot2.data}' ' $subtext2',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 60.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return const Text('0');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2StreamBuilderWithAnswer extends StatelessWidget {
  final double result1;
  final double result2;
  final String title1;
  final String title2;
  final String subtext1;
  final String subtext2;

  const GlobalRowCompareWidget2StreamBuilderWithAnswer(
      {super.key,
      required this.subtext1,
      required this.subtext2,
      required this.title1,
      required this.title2,
      required this.result1,
      required this.result2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          SizedBox(
            width: 420.w,
            child: Text(
              title1,
              style: TextStyle(
                  // color: Colors.black,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),

          //Text field 1
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 110.h,
            width: 450.w,
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.black,
              //   width: 1.0,
              // ),
              // boxShadow: [BoxShadow(blurRadius: 50)],
              color: Colors.grey,
              // gradient:
              //     const LinearGradient(colors: [Colors.white38, Colors.white]
              //     ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Tooltip(
              message: '$result1' ' $subtext1',
              child: GradientText(
                '$result1' ' $subtext1',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                colors: [
                  Colors.black,
                  // Colors.teal,
                  Colors.red,
                ],
              ),
            ),
          ),

          //Text field 2
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 110.h,
            width: 450.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Tooltip(
              message: '$result2' ' $subtext2',
              child: GradientText(
                '$result2' ' $subtext2',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                colors: [
                  Colors.black,
                  // Colors.teal,
                  Colors.red,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
