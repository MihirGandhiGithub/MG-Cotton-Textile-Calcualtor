import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Text/CustomText.dart';

class HomePageBoxContainer extends StatelessWidget {
  final String imageAsset;
  final String buttonText;
  final VoidCallback onPressed;

  const HomePageBoxContainer({
    super.key,
    required this.imageAsset,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // fixedSize: Size(420.w, 500.h),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        elevation: 5.0,
        shadowColor: Colors.grey.withOpacity(1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imageAsset),
            height: 300.sp,
          ),
          CustomText(
            text: buttonText,
            color: Colors.black,
            maxLine: 2,
            bold: true,
          )
        ],
      ),
    );
  }
}
