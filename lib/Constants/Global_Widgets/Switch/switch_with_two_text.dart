import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWithTwoText extends StatelessWidget {
  final bool bigText;
  final String frontText;
  final String backText;
  final ValueChanged<bool> onChange;
  final bool switchValue;
  const SwitchWithTwoText(
      {super.key,
      required this.frontText,
      required this.backText,
      required this.onChange,
      required this.switchValue,
      required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          frontText,
          maxLines: 3,
          style: TextStyle(
              // color: Colors.black,
              fontSize: bigText ? 60.sp : 40.sp),
        ),
        Switch(
            // This bool value toggles the switch.
            value: switchValue,
            // activeColor: Colors.blue,
            // inactiveTrackColor: Colors.white,
            // thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
            onChanged: onChange),
        Text(
          backText,
          maxLines: 3,
          style: TextStyle(
              // color: Colors.black,
              fontSize: bigText ? 60.sp : 40.sp),
        ),
      ],
    );
  }
}
