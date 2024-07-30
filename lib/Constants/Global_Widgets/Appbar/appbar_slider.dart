import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../StageManagementClass/provider_state_management.dart';

class AppBarWithSlider extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final String sliderText1;
  final String sliderText2;
  final bool isBackButton;
  const AppBarWithSlider(
      {super.key,
      required this.titleText,
      required this.sliderText1,
      required this.sliderText2,
      required this.isBackButton});
  @override
  Size get preferredSize => Size.fromHeight(350.h);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    void _showConfirmationDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Theme Change'),
            content: Text(
                'Are you sure you want to switch to ${themeProvider.themeMode.name == 'Light' ? 'Dark' : 'Light'} mode?'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  themeProvider.toggleTheme();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return AppBar(
      leading: isBackButton
          ? IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home_screen');
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: themeProvider.isLoading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator()),
                  )
                : themeProvider.themeMode.name == 'Light'
                    ? Icon(Icons.dark_mode_outlined)
                    : Icon(Icons.dark_mode_rounded),
            // onTap: () {
            //   themeProvider.toggleTheme();
            // },
            onTap: () {
              _showConfirmationDialog(context);
            },
          ),
        ),
      ],

      title: Text(
        titleText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // backgroundColor: Colors.blue,
      elevation: 2,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(40),
      //   ),
      // ),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Container(
                margin: EdgeInsets.fromLTRB(80.w, 0, 80.w, 30.h),
                padding: EdgeInsets.only(
                    top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
                height: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  enableFeedback: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 0.5),

                    color: themeProvider.themeMode.name == 'Light'
                        ? Colors.blue
                        : Colors.grey[800],
                    // gradient: const LinearGradient(
                    //     begin: Alignment.centerRight,
                    //     end: Alignment.centerLeft,
                    //     colors: [
                    //       Colors.blue,
                    //       Colors.blue,
                    //     ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: sliderText1,
                    ),
                    Tab(
                      text: sliderText2,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
