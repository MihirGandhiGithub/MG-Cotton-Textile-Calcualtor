import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_with_text.dart';
import '../../../Constants/Global_Widgets/Buttons/floating_share.dart';
import '../../../Constants/Global_Widgets/Buttons/gradient_text.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/navigate_page_with_animation.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/Row/three_content.dart';
import 'compare_spinning.dart';

class HomeSpinningCalculator extends StatefulWidget {
  const HomeSpinningCalculator({Key? key}) : super(key: key);

  @override
  State<HomeSpinningCalculator> createState() => _HomeSpinningCalculatorState();
}

class _HomeSpinningCalculatorState extends State<HomeSpinningCalculator>
    with SingleTickerProviderStateMixin {
  ScreenshotController screenshotController = ScreenshotController();
  // for focusing  a node
  FocusNode focusnodekapas1 = FocusNode();

  bool isNagative = false;
  //String answer
  static double answerCottonRate = 0;
  static double ansMatrialCoast = 0;
  static double ansYarnCoast = 0;
  static double ansProfitLoss = 0;

  final yarnCount = TextEditingController();
  final cottonRate = TextEditingController();
  final yield = TextEditingController();
  final wasteRecovery = TextEditingController();
  final conversationCoast = TextEditingController();
  final commission = TextEditingController();
  final otherExpense = TextEditingController();
  final yarnRate = TextEditingController();

  void _cottonRate() {
    double storeYarnCount = double.tryParse(yarnCount.text) ?? 0;
    double storecottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeYeild = double.tryParse(yield.text) ?? 0;
    double storeWasteRecovery = double.tryParse(wasteRecovery.text) ?? 0;
    double storeConversationCoast =
        double.tryParse(conversationCoast.text) ?? 0;
    double storeCommission = double.tryParse(commission.text) ?? 0;
    double storeOtherExpense = double.tryParse(otherExpense.text) ?? 0;
    double storeYarnRate = double.tryParse(yarnRate.text) ?? 0;

    double a = storecottonRate / 355.60; //160.29
    double b = a / storeYeild * 100; //242.86
    double c = b - storeWasteRecovery; //182.86
    double d = storeYarnCount * storeConversationCoast; //60
    double e = c + d; //242.86
    double f = c * storeCommission / 100; //1.82
    double h = e + f; //244.68
    double i = h + storeOtherExpense; //249.68
    double j = i - storeYarnRate;

    // double g=

    // double e = (c * storeWasteRecovery * storeCommission) / 100; //1.82
    // double f = e + b; //244.68
    // double g = f + storeOtherExpense; //249.68
    // double h = g - storeYarnRate;

    setState(() {
      answerCottonRate = double.parse(a.toStringAsFixed(2));
      ansMatrialCoast = double.parse(c.toStringAsFixed(2));
      ansYarnCoast = double.parse(i.toStringAsFixed(2));
      if (j < 0) {
        isNagative = true;
      } else {
        isNagative = false;
      }
      ansProfitLoss = double.parse(j.toStringAsFixed(2));
    });
  }

  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'spinning_screen');
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
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
            appBar: const AppbarWithText(
              appbarText: 'Spinning Calculator',
              centerTitle: false,
              isBackButton: true,
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 50.h,
                ),
                // Yarn Count
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Yarn Count',
                  controller: yarnCount,
                  subtitle: 'No.',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                //Cotton Rate
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Cotton Rate',
                  controller: cottonRate,
                  subtitle: '₹/Candy',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                //  Result Cotton Rate
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Cotton Rate',
                  result: answerCottonRate,
                ),

                // Yield
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Yield',
                  controller: yield,
                  subtitle: '%',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                // Waste Recovery
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Waste Recovery',
                  controller: wasteRecovery,
                  subtitle: '₹/kg',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                // Material Coast
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Material Rate',
                  result: ansMatrialCoast,
                ),

                // Coversation Coast
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Conversion Coast',
                  controller: conversationCoast,
                  subtitle: '₹/kg/Count',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                // Commission
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Commission',
                  controller: commission,
                  subtitle: '%',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                // Other Expense
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Other Expenses',
                  controller: otherExpense,
                  subtitle: '₹/kg',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                //Yarn Coast
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Yarn Rate',
                  result: ansYarnCoast,
                ),

                //Yarn Rate
                GlobalRowWidgetWithOnchanged(
                  height: globalSingalTextfiedHeight,
                  width: globalSingalTextfiedWidth,
                  title: 'Yarn Rate',
                  controller: yarnRate,
                  subtitle: '₹/kg',
                  onchaned: (value) {
                    _cottonRate();
                  },
                ),

                //  Result Cotton Coast
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: isNagative ? 'Loss' : 'Profit',
                  result: ansProfitLoss,
                ),

                // Reset Button
                GlobalButtonSimpleText(
                  onPressed: () {
                    yarnCount.clear();
                    cottonRate.clear();
                    yield.clear();
                    wasteRecovery.clear();
                    conversationCoast.clear();
                    commission.clear();
                    otherExpense.clear();
                    yarnRate.clear();

                    setState(() {
                      answerCottonRate = 0;
                      ansMatrialCoast = 0;
                      ansYarnCoast = 0;
                      ansProfitLoss = 0;
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
                    const CompareSpinning(
                      forOrReverse: true,
                    ),
                  ),
                  buttontext: 'Compare',
                  height: globalSingalComareButtonHeight,
                  width: globalSingalComareButtonWidth,
                ),

                SizedBox(
                  height: 20.h,
                )
              ],
            ),
            floatingActionButton: FloatingButton(
              screenshotController: screenshotController,
              isVisible: keyboardIsOpened,
            )),
      ),
    );
  }
}
