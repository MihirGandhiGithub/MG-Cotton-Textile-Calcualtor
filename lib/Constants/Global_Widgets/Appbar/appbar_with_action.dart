import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Text/CustomText.dart';

class AppbarWithAction extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final String appbarText;
  final IconData appbarIcon;
  final VoidCallback appbarIconOnPress;

  const AppbarWithAction(
      {super.key,
      required this.appbarText,
      required this.appbarIcon,
      required this.appbarIconOnPress,
      required this.centerTitle});
  @override
  Size get preferredSize => Size.fromHeight(180.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            icon: Icon(
              appbarIcon,
              // color: Colors.white,
              // size: 100.sp,
            ),
            onPressed: appbarIconOnPress)
      ],
      centerTitle: centerTitle,
      title: CustomText(
        text: appbarText,
        color: Colors.white,
        maxLine: 1,
        bold: false,
      ),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(30),
      //   ),
      // ),
      // backgroundColor: Colors.blue,
      elevation: 2,
    );
  }
}
