import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../StageManagementClass/provider_state_management.dart';

class AppbarWithText extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final bool centerTitle;
  final String appbarText;

  const AppbarWithText(
      {super.key,
      required this.appbarText,
      required this.centerTitle,
      required this.isBackButton});
  @override
  Size get preferredSize => Size.fromHeight(180.h);
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
      centerTitle: centerTitle,
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
        appbarText,
        style: TextStyle(color: Colors.white),
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
