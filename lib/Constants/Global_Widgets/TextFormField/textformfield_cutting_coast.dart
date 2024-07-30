import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../StageManagementClass/provider_state_management.dart';

class textformfield_cutting_coast extends StatelessWidget {
  final String? title;
  final TextEditingController controllerFix;
  final TextEditingController controllerEnterd;
  final TextEditingController controllerAmount;
  final ValueChanged onChangedFix;
  final ValueChanged onChangedEnterd;
  final ValueChanged onChangedAMount;

  final bool isLastField;
  final bool numberKeyboard;
  const textformfield_cutting_coast({
    Key? key,
    required this.title,
    required this.controllerFix,
    required this.controllerEnterd,
    required this.controllerAmount,
    required this.onChangedFix,
    required this.onChangedEnterd,
    required this.onChangedAMount,
    required this.isLastField,
    required this.numberKeyboard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 200.w,
            margin: EdgeInsets.only(left: 80.w),
            child: Text(
              title.toString(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.white70,
                fontSize: 45.sp,
              ),
            ),
          ),

          //Text field
          Row(
            children: [
              SizedBox(
                height: 120.h,
                width: 250.w,
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: controllerFix,
                  cursorColor: Colors.black,
                  onChanged: onChangedFix,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: themeProvider.themeMode.name == 'Light'
                        ? Colors.white
                        : Colors
                            .white10, // Set your desired background color here
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          70.sp), // Set the circular border radius here
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 5.sp,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 30.sp),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),

              //Out of Text
              Container(
                width: 130.w,
                margin: EdgeInsets.only(left: 10.w),
                child: Text(
                  'Out of',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.themeMode.name == 'Light'
                        ? Colors.black
                        : Colors.white70,
                    fontSize: 40.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                width: 250.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controllerEnterd,
                  cursorColor: Colors.black,
                  onChanged: onChangedEnterd,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),
              Container(
                width: 170.w,
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  'Amount',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.themeMode.name == 'Light'
                        ? Colors.black
                        : Colors.white70,
                    fontSize: 40.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                width: 250.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controllerAmount,
                  cursorColor: Colors.black,
                  onChanged: onChangedAMount,
                  keyboardType: TextInputType.number,
                  textInputAction:
                      isLastField ? TextInputAction.done : TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),
              //sub text
            ],
          ),
        ],
      ),
    );
  }
}

class textformfield_cutting_coast_percentage extends StatelessWidget {
  final String? title;
  final TextEditingController controllerFix;
  final TextEditingController controllerEnterd;

  final ValueChanged onChangedFix;
  final ValueChanged onChangedEnterd;

  final bool isLastField;
  final bool numberKeyboard;
  const textformfield_cutting_coast_percentage({
    Key? key,
    required this.title,
    required this.controllerFix,
    required this.controllerEnterd,
    required this.onChangedFix,
    required this.onChangedEnterd,
    required this.isLastField,
    required this.numberKeyboard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 250.w,
            margin: EdgeInsets.only(left: 80.w),
            child: Text(
              title.toString(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.white70,
                fontSize: 45.sp,
              ),
            ),
          ),

          //Text field
          Row(
            children: [
              SizedBox(
                height: 120.h,
                width: 250.w,
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: controllerFix,
                  cursorColor: Colors.black,
                  onChanged: onChangedFix,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: themeProvider.themeMode.name == 'Light'
                        ? Colors.white
                        : Colors
                            .white10, // Set your desired background color here
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          70.sp), // Set the circular border radius here
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 5.sp,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 30.sp),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),

              //Out of Text
              Container(
                width: 130.w,
                margin: EdgeInsets.only(left: 10.w),
                child: Text(
                  'Out of',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.themeMode.name == 'Light'
                        ? Colors.black
                        : Colors.white70,
                    fontSize: 40.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                width: 250.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: controllerEnterd,
                  cursorColor: Colors.black,
                  onChanged: onChangedEnterd,
                  keyboardType: TextInputType.number,
                  inputFormatters: const [],
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),

              //sub text
            ],
          ),
        ],
      ),
    );
  }
}

class textformfield_cutting_coast_intrest extends StatelessWidget {
  final TextEditingController controllerFix;
  final TextEditingController controllerEnterd;
  final TextEditingController controllerAmount;
  final ValueChanged onChangedFix;
  final ValueChanged onChangedEnterd;
  final ValueChanged onChangedAMount;

  final bool isLastField;
  final bool numberKeyboard;
  const textformfield_cutting_coast_intrest({
    Key? key,
    required this.controllerFix,
    required this.controllerEnterd,
    required this.controllerAmount,
    required this.onChangedFix,
    required this.onChangedEnterd,
    required this.onChangedAMount,
    required this.isLastField,
    required this.numberKeyboard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Container(
            width: 180.w,
            margin: EdgeInsets.only(left: 80.w),
            child: Text(
              'Intrest %',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.white70,
                fontSize: 45.sp,
              ),
            ),
          ),
          SizedBox(
            height: 120.h,
            width: 250.w,
            child: TextField(
              textAlign: TextAlign.left,
              controller: controllerFix,
              cursorColor: Colors.black,
              onChanged: onChangedFix,
              // cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.themeMode.name == 'Light'
                    ? Colors.white
                    : Colors.white10, // Set your desired background color here
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      70.sp), // Set the circular border radius here
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5.sp,
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 30.sp),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: const [],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),

          //Out of Text
          Container(
            width: 170.w,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10.w),
            child: Text(
              'Amount',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.white70,
                fontSize: 40.sp,
              ),
            ),
          ),
          SizedBox(
            height: 120.h,
            width: 300.w,
            child: TextField(
              textAlign: TextAlign.center,
              controller: controllerEnterd,
              cursorColor: Colors.black,
              onChanged: onChangedEnterd,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),
          Container(
            width: 90.w,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10.w),
            child: Text(
              'Day',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.white70,
                fontSize: 45.sp,
              ),
            ),
          ),
          SizedBox(
            height: 120.h,
            width: 250.w,
            child: TextField(
              textAlign: TextAlign.center,
              controller: controllerAmount,
              cursorColor: Colors.black,
              onChanged: onChangedAMount,
              keyboardType: TextInputType.number,
              textInputAction:
                  isLastField ? TextInputAction.done : TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),
          //sub text
        ],
      ),
    );
  }
}
