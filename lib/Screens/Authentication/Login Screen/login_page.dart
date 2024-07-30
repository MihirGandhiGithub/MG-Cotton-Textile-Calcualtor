import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../Constants/Global_Variables/Screen Util Size.dart';
import '../../../StageManagementClass/provider_state_management.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeMode.name == 'Light'
          ? Colors.blue
          : Colors.blueGrey,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.white,
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(text50sp),
                decoration: BoxDecoration(
                  color: themeProvider.themeMode.name == 'Light'
                      ? Colors.white
                      : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(0, 0),
                      color: Colors.black,
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Lottie.asset('assets/new4.json'),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(bottom: SUheight100h),
                    //   child: Consumer<firebaseConfigrations>(
                    //     builder: (context, firebaseConfigration, child) {
                    //       return firebaseConfigration.isLoadingApple
                    //           ? const CircularProgressIndicator()
                    //           : ElevatedButton.icon(
                    //               style: ElevatedButton.styleFrom(
                    //                 elevation: 10,
                    //                 backgroundColor:
                    //                     themeProvider.themeMode.name == 'Light'
                    //                         ? Colors.white
                    //                         : Colors.white60,
                    //                 shape: RoundedRectangleBorder(
                    //                   borderRadius:
                    //                       BorderRadius.circular(50.sp),
                    //                 ),
                    //               ),
                    //               onPressed: () async {
                    //                 await firebaseConfigration
                    //                     .signInWithApple(context);
                    //               },
                    //               label: Padding(
                    //                 padding: EdgeInsets.only(
                    //                   right: SUwidth40w,
                    //                   left: SUwidth40w,
                    //                   top: SUheight40h,
                    //                   bottom: SUheight40h,
                    //                 ),
                    //                 child: const Text(
                    //                   'Continue With Apple',
                    //                   style: TextStyle(color: Colors.black),
                    //                 ),
                    //               ),
                    //               icon: SizedBox(
                    //                 width: SUwidth100w,
                    //                 child: Icon(
                    //                   Icons.apple,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //             );
                    //     },
                    //   ),
                    // ),

                    //Google Signin
                    Padding(
                      padding: EdgeInsets.only(bottom: SUheight100h),
                      child: Consumer<firebaseConfigrations>(
                        builder: (context, firebaseConfigration, child) {
                          return firebaseConfigration.isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor:
                                        themeProvider.themeMode.name == 'Light'
                                            ? Colors.white
                                            : Colors.white60,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await firebaseConfigration
                                        .signInWithGoogle(context);
                                  },
                                  label: Padding(
                                    padding: EdgeInsets.only(
                                      right: SUwidth40w,
                                      left: SUwidth40w,
                                      top: SUheight40h,
                                      bottom: SUheight40h,
                                    ),
                                    child: const Text(
                                      'Continue With Google',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  icon: SizedBox(
                                    width: SUwidth100w,
                                    child: Image.asset(
                                        'assets/google_signin_logo.png'),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
