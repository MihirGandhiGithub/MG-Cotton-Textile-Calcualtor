import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_slider.dart';
import '../../../Constants/Global_Widgets/Buttons/floating_share.dart';
import '../../../Constants/Global_Widgets/Buttons/gradient_text.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/navigate_page_with_animation.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/Row/three_content.dart';
import 'compare_oilmill.dart';

double answer = 0;
bool forwardCalulateMix = false;
final inputkapas1 = TextEditingController();
final inputexpense1 = TextEditingController();
final inputoilrate1 = TextEditingController();
final inputkapasia1 = TextEditingController();
final inpututaro1 = TextEditingController();
final inputghati1 = TextEditingController();

double reverseanswer = 0;

bool reverseCalulateMix = false;

final reverseinputkapas1 = TextEditingController();
final revereseinputexpense1 = TextEditingController();
final reverseinputoilrate1 = TextEditingController();
final reverseinputkapasia1 = TextEditingController();
final reverseinpututaro1 = TextEditingController();
final reverseinputghati1 = TextEditingController();

class HomeSingalOilMillCalculator extends StatefulWidget {
  const HomeSingalOilMillCalculator({Key? key}) : super(key: key);

  @override
  State<HomeSingalOilMillCalculator> createState() =>
      _HomeSingalOilMillCalculatorState();
}

class _HomeSingalOilMillCalculatorState
    extends State<HomeSingalOilMillCalculator>
    with SingleTickerProviderStateMixin {
  ScreenshotController screenshotController = ScreenshotController();
  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'oilmill_screen');
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setPageName();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home_screen');
        return Future.value(false); // Allow popping the screen
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Screenshot(
          controller: screenshotController,
          child: Scaffold(
              appBar: const AppBarWithSlider(
                titleText: 'Oil Mill Calculator',
                sliderText1: 'Forward',
                sliderText2: 'Reverse',
                isBackButton: true,
              ),
              body: const TabBarView(
                children: [
                  OilmillForward(),
                  OilmillReverse(),
                ],
              ),
              floatingActionButton: FloatingButton(
                screenshotController: screenshotController,
                isVisible: keyboardIsOpened,
              )),
        ),
      ),
    );
  }
}

class OilmillForward extends StatefulWidget {
  const OilmillForward({super.key});

  @override
  State<OilmillForward> createState() => _OilmillForwardState();
}

class _OilmillForwardState extends State<OilmillForward> {
  void _updateValuesForCalculator1() {
    double storeInputKapas1 = double.tryParse(inputkapas1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(inputexpense1.text) ?? 0;
    double storeInputOilrate1 = double.tryParse(inputoilrate1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(inputkapasia1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(inputghati1.text) ?? 0;
    double sum1 = (storeInputKapas1 + storeInputExpense1);

    if (storeInputKapas1 != 0 &&
        storeInputExpense1 == 0 &&
        storeInputKapasia1 == 0 &&
        storeInputOilrate1 == 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      setState(() {
        answer = double.parse(storeInputKapas1.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 == 0 &&
        storeInputKapasia1 == 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      setState(() {
        answer = double.parse(sum1.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 == 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      double a3 = (storeInputOilrate1 / 10);

      setState(() {
        answer = double.parse(a3.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 != 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      double a2 = sum1 * 5;
      double a3 = (storeInputOilrate1 / 10) * storeInputKapasia1;
      double a4 = a2 - a3;

      setState(() {
        answer = double.parse(a4.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 != 0 &&
        storeInputUtaro1 != 0 &&
        storeInputGhati1 == 0) {
      double a2 = sum1 * 5;
      double a3 = (storeInputOilrate1 / 10) * storeInputKapasia1;
      double a4 = a2 - a3;
      double f = (a4 / storeInputUtaro1);

      setState(() {
        answer = double.parse(f.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 != 0 &&
        storeInputUtaro1 != 0 &&
        storeInputGhati1 != 0) {
      double a2 = sum1 * 5;
      double a3 = (storeInputOilrate1 / 10) * storeInputKapasia1;
      double a4 = a2 - a3;
      double f = (a4 / storeInputUtaro1) * storeInputGhati1;

      setState(() {
        answer = double.parse(f.toStringAsFixed(2));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: forwardCalulateMix
          ? ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pure',
                      style: TextStyle(
                          // color: Colors.black,
                          fontSize: 70.sp),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: forwardCalulateMix,
                      // overlayColor: overlayColor,
                      // trackColor: trackColor,
                      // activeColor: Colors.blue,
                      // inactiveTrackColor: Colors.white,
                      thumbColor:
                          const MaterialStatePropertyAll<Color>(Colors.black),
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          forwardCalulateMix = value;
                        });
                      },
                    ),
                    Text(
                      'Mix',
                      style: TextStyle(
                          // color: Colors.black,
                          fontSize: 70.sp),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'Soon...',
                    style: TextStyle(
                        // color: Colors.black,
                        fontSize: 60.sp),
                  ),
                ),
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Cotton Seed',
                //   controller: inputkapas1,
                //   subtitle: '₹/20kg',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // //NOTHING
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Hull Rate',
                //   controller: inputkapas1,
                //   subtitle: 'Kgs.',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                // //NOTHING
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Cotton Seed Qty.',
                //   controller: inputkapas1,
                //   subtitle: 'Kgs.',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                // //NOTHING
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Hull Qty.',
                //   controller: inputkapas1,
                //   subtitle: 'Kgs.',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // // Expense
                //
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Expense',
                //   controller: inputexpense1,
                //   subtitle: '₹/20kg',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // //Oil Rate
                //
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Oil Rate',
                //   controller: inputoilrate1,
                //   subtitle: '₹/20kg',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // // Out Turn / Utaro
                //
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Oil',
                //   controller: inputkapasia1,
                //   subtitle: 'Percentage %',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // //NOTHING
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Shortage',
                //   controller: inputkapas1,
                //   subtitle: '%',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // //Packing Size
                // GlobalRowWidgetWithOnchanged(
                //   height: globalSingalTextfiedHeight,
                //   width: globalSingalTextfiedWidth,
                //   title: 'Packing Size',
                //   controller: inputghati1,
                //   subtitle: 'Kgs.',
                //   onchaned: (string) {
                //     _updateValuesForCalculator1();
                //   },
                // ),
                //
                // SizedBox(height: 30.h),
                //
                // // Stram result
                // GlobalResultBuilderForResults(
                //   substreamtext: '₹/20Kg',
                //   streamtitletext: 'Oil Cake Cost',
                //   result: answer,
                // ),
                //
                // // Reset Button
                // GlobalButtonSimpleText(
                //   onPressed: () {
                //     inputkapas1.clear();
                //     inputexpense1.clear();
                //     inputkapasia1.clear();
                //     inpututaro1.clear();
                //     inputghati1.clear();
                //     answer = 0;
                //   },
                //   buttontext: 'Reset',
                //   height: globalSingalResetButtonHeight,
                //   width: globalSingalResetButtonWidth,
                // ),
                //
                // //Compare Button
                // GlobalButtonGradientText(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => HomeCompareOilMillCalculator(
                //           compareReverseCalculatemix: reverseCalulateMix,
                //           compareForwardCalculatemix: forwardCalulateMix,
                //           isReverse: 0,
                //         ),
                //       ),
                //     );
                //   },
                //   buttontext: 'Compare',
                //   height: globalSingalComareButtonHeight,
                //   width: globalSingalComareButtonWidth,
                // ),
              ],
            )
          : ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pure',
                      style: TextStyle(
                          // color: Colors.black,
                          fontSize: 70.sp),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: forwardCalulateMix,
                      // overlayColor: overlayColor,
                      // trackColor: trackColor,
                      // activeColor: Colors.blue,
                      // inactiveTrackColor: Colors.white,
                      thumbColor:
                          const MaterialStatePropertyAll<Color>(Colors.black),
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          forwardCalulateMix = value;
                        });
                      },
                    ),
                    Text(
                      'Mix',
                      style: TextStyle(
                          // color: Colors.black,
                          fontSize: 70.sp),
                    ),
                  ],
                ),
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Cotton Seed',
                  controller: inputkapas1,
                  subtitle: '₹/20kg',
                  onchaned: (string) {
                    _updateValuesForCalculator1();
                  },
                ),

                // Expense

                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Expenses',
                  controller: inputexpense1,
                  subtitle: '₹/20kg',
                  onchaned: (string) {
                    _updateValuesForCalculator1();
                  },
                ),

                // Cotton Seed

                //Oil Rate

                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Oil Rate',
                  controller: inputoilrate1,
                  subtitle: '₹/10kg',
                  onchaned: (string) {
                    _updateValuesForCalculator1();
                  },
                ),

                // Out Turn / Utaro

                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Oil',
                  controller: inputkapasia1,
                  subtitle: '%',
                  onchaned: (string) {
                    _updateValuesForCalculator1();
                  },
                ),

                // Shortage / Ghati
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Oil Cake',
                  controller: inpututaro1,
                  subtitle: '%',
                  onchaned: (string) {
                    _updateValuesForCalculator1();
                  },
                ),

                //Packing Size
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Packing Size',
                  controller: inputghati1,
                  subtitle: 'Kg',
                  onchaned: (string) {
                    _updateValuesForCalculator1();
                  },
                ),

                // Stram result
                GlobalResultBuilderForResults(
                  substreamtext: '₹/20Kg',
                  streamtitletext: 'Oil Cake Cost',
                  result: answer,
                ),

                // Reset Button
                GlobalButtonSimpleText(
                  onPressed: () {
                    inputkapas1.clear();
                    inputexpense1.clear();
                    inputoilrate1.clear();
                    inputkapasia1.clear();
                    inpututaro1.clear();
                    inputghati1.clear();
                    setState(() {
                      answer = 0;
                    });
                  },
                  buttontext: 'Reset',
                  height: globalSingalResetButtonHeight,
                  width: globalSingalResetButtonWidth,
                ),

                //Compare Button
                GlobalButtonGradientText(
                  onPressed: () => CustomNavigator().navigateToPage(
                    context,
                    HomeCompareOilMillCalculator(
                      isReverse: 0,
                      compareReverseCalculatemix: reverseCalulateMix,
                      compareForwardCalculatemix: forwardCalulateMix,
                    ),
                  ),
                  buttontext: 'Compare',
                  height: globalSingalComareButtonHeight,
                  width: globalSingalComareButtonWidth,
                ),
              ],
            ),
    );
  }
}

class OilmillReverse extends StatefulWidget {
  const OilmillReverse({super.key});

  @override
  State<OilmillReverse> createState() => _OilmillReverseState();
}

class _OilmillReverseState extends State<OilmillReverse> {
  void _reverseUpdateValuesForCalculator1() {
    double storeInputKapas1 = double.tryParse(reverseinputkapas1.text) ?? 0;
    double storeInputExpense1 =
        double.tryParse(revereseinputexpense1.text) ?? 0;
    double storeInputOilrate1 = double.tryParse(reverseinputoilrate1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(reverseinputkapasia1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(reverseinpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(reverseinputghati1.text) ?? 0;
    double sum1 = (storeInputKapas1 + storeInputExpense1);

    if (storeInputKapas1 != 0 &&
        storeInputExpense1 == 0 &&
        storeInputKapasia1 == 0 &&
        storeInputOilrate1 == 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      setState(() {
        reverseanswer = double.parse(storeInputKapas1.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 == 0 &&
        storeInputKapasia1 == 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      setState(() {
        reverseanswer = double.parse(sum1.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 == 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      double a2 = (storeInputKapas1);
      double a3 = (storeInputOilrate1 / 10);
      double a4 = a2 + a3;
      double a5 = a4 / 5;
      double f = (a5 - storeInputExpense1);

      setState(() {
        reverseanswer = double.parse(f.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 != 0 &&
        storeInputUtaro1 == 0 &&
        storeInputGhati1 == 0) {
      double a2 = (storeInputKapas1);
      double a3 = (storeInputOilrate1 / 10) * storeInputKapasia1;
      double a4 = a2 + a3;
      double a5 = a4 / 5;
      double f = (a5 - storeInputExpense1);

      setState(() {
        reverseanswer = double.parse(f.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 != 0 &&
        storeInputUtaro1 != 0 &&
        storeInputGhati1 == 0) {
      double a2 = (storeInputKapas1) * storeInputUtaro1;
      double a3 = (storeInputOilrate1 / 10) * storeInputKapasia1;
      double a4 = a2 + a3;
      double a5 = a4 / 5;
      double f = (a5 - storeInputExpense1);

      setState(() {
        reverseanswer = double.parse(f.toStringAsFixed(2));
      });
    } else if (storeInputKapas1 != 0 &&
        storeInputExpense1 != 0 &&
        storeInputOilrate1 != 0 &&
        storeInputKapasia1 != 0 &&
        storeInputUtaro1 != 0 &&
        storeInputGhati1 != 0) {
      double a2 = (storeInputKapas1 / storeInputGhati1) * storeInputUtaro1;
      double a3 = (storeInputOilrate1 / 10) * storeInputKapasia1;
      double a4 = a2 + a3;
      double a5 = a4 / 5;
      double f = (a5 - storeInputExpense1);

      setState(() {
        reverseanswer = double.parse(f.toStringAsFixed(2));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: reverseCalulateMix
            ? ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pure',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 70.sp),
                      ),
                      Switch(
                        // This bool value toggles the switch.
                        value: reverseCalulateMix,
                        // overlayColor: overlayColor,
                        // trackColor: trackColor,
                        activeColor: Colors.blue,
                        inactiveTrackColor: Colors.white,
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.black),
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            reverseCalulateMix = value;
                          });
                        },
                      ),
                      Text(
                        'Mix',
                        style: TextStyle(
                            // color: Colors.black,
                            fontSize: 70.sp),
                      ),
                    ],
                  ),

                  Center(
                    child: Text(
                      'Soon...',
                      style: TextStyle(
                          // color: Colors.black,
                          fontSize: 60.sp),
                    ),
                  )
                  // //kapas
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Oil Cake Cost',
                  //   controller: reverseinputkapas1,
                  //   subtitle: '₹/Bale',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Hull Rate',
                  //   controller: inputkapas1,
                  //   subtitle: 'Kgs.',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  // //NOTHING
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Cotton Seed Qty.',
                  //   controller: inputkapas1,
                  //   subtitle: 'Kgs.',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  // //NOTHING
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Hull Qty.',
                  //   controller: inputkapas1,
                  //   subtitle: 'Kgs.',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  //
                  // // Expense
                  //
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Expense',
                  //   controller: inputexpense1,
                  //   subtitle: '₹/20kg',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  //
                  // // Cotton Seed
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Oil Rate',
                  //   controller: reverseinputoilrate1,
                  //   subtitle: '₹/20kg',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  //
                  // // Out Turn / Utaro
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Oil',
                  //   controller: reverseinputkapasia1,
                  //   subtitle: 'Percentage %',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  //
                  // // Shortage / Ghati
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Shortage',
                  //   controller: reverseinpututaro1,
                  //   subtitle: 'Percentage %',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  //
                  // // PAckaging Size
                  // GlobalRowWidgetWithOnchanged(
                  //   height: globalSingalTextfiedHeight,
                  //   width: globalSingalTextfiedWidth,
                  //   title: 'Packing Size',
                  //   controller: reverseinputghati1,
                  //   subtitle: 'Kg',
                  //   onchaned: (string) {
                  //     _reverseUpdateValuesForCalculator1();
                  //   },
                  // ),
                  //
                  // // Dispaly Stream Text
                  // GlobalResultBuilderForResults(
                  //   substreamtext: '₹/20Kg',
                  //   streamtitletext: 'Cotton Seed',
                  //   result: reverseanswer,
                  // ),
                  //
                  // // Reset Button
                  // GlobalButtonSimpleText(
                  //   onPressed: () {
                  //     reverseinputkapas1.clear();
                  //     revereseinputexpense1.clear();
                  //     reverseinputkapasia1.clear();
                  //     reverseinpututaro1.clear();
                  //     reverseinputghati1.clear();
                  //   },
                  //   buttontext: 'Reset',
                  //   height: globalSingalResetButtonHeight,
                  //   width: globalSingalResetButtonWidth,
                  // ),
                  //
                  // //Compare Button
                  // GlobalButtonGradientText(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => HomeCompareOilMillCalculator(
                  //           isReverse: 1,
                  //           compareReverseCalculatemix: reverseCalulateMix,
                  //           compareForwardCalculatemix: forwardCalulateMix,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   buttontext: 'Compare',
                  //   height: globalSingalComareButtonHeight,
                  //   width: globalSingalComareButtonWidth,
                  // ),
                ],
              )
            : ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Pure',
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 70.sp),
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: reverseCalulateMix,
                            // overlayColor: overlayColor,
                            // trackColor: trackColor,
                            // activeColor: Colors.blue,
                            // inactiveTrackColor: Colors.white,
                            thumbColor: const MaterialStatePropertyAll<Color>(
                                Colors.black),
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                reverseCalulateMix = value;
                              });
                            },
                          ),
                          Text(
                            'Mix',
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 70.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //kapas
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Oil Cake Cost',
                    controller: reverseinputkapas1,
                    subtitle: '₹/Bag',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Expense
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses',
                    controller: revereseinputexpense1,
                    subtitle: '₹/20kg',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Cotton Seed
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Oil Rate',
                    controller: reverseinputoilrate1,
                    subtitle: '₹/10kg',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Out Turn / Utaro
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Oil',
                    controller: reverseinputkapasia1,
                    subtitle: '%',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Shortage / Ghati
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Oil Cake',
                    controller: reverseinpututaro1,
                    subtitle: '%',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // PAckaging Size
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Packing Size',
                    controller: reverseinputghati1,
                    subtitle: 'Kg',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Dispaly Stream Text
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/20Kg',
                    streamtitletext: 'Cotton Seed',
                    result: reverseanswer,
                  ),

                  // Reset Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      reverseinputkapas1.clear();
                      revereseinputexpense1.clear();
                      reverseinputoilrate1.clear();
                      reverseinputkapasia1.clear();
                      reverseinpututaro1.clear();
                      reverseinputghati1.clear();
                      setState(() {
                        reverseanswer = 0;
                      });
                    },
                    buttontext: 'Reset',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),

                  //Compare Button
                  GlobalButtonGradientText(
                    onPressed: () => CustomNavigator().navigateToPage(
                      context,
                      HomeCompareOilMillCalculator(
                        isReverse: 1,
                        compareReverseCalculatemix: reverseCalulateMix,
                        compareForwardCalculatemix: forwardCalulateMix,
                      ),
                    ),
                    buttontext: 'Compare',
                    height: globalSingalComareButtonHeight,
                    width: globalSingalComareButtonWidth,
                  ),
                ],
              ));
  }
}
