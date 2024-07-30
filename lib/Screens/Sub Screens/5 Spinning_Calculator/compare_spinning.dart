import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';

import '../../../Constants/Global_Widgets/Appbar/appbar_with_text.dart';
import '../../../Constants/Global_Widgets/Buttons/floating_share.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/row_with_2_item.dart';

class CompareSpinning extends StatefulWidget {
  final bool forOrReverse;
  const CompareSpinning({Key? key, required this.forOrReverse})
      : super(key: key);

  @override
  State<CompareSpinning> createState() => _CompareSpinningState();
}

class _CompareSpinningState extends State<CompareSpinning>
    with SingleTickerProviderStateMixin {
  ScreenshotController screenshotController = ScreenshotController();

  bool isNagative = false;

  bool isNagative2 = false;
  //For Calculator 1 Answer
  static double answerCottonRate = 0;
  static double ansMatrialCoast = 0;
  static double ansYarnCoast = 0;
  static double ansProfitLoss = 0;

  //For Calulator 2 Answer
  static double answerCottonRate2 = 0;
  static double ansMatrialCoast2 = 0;
  static double ansYarnCoast2 = 0;

  static double ansProfitLoss2 = 0;

  double diffCottonRate = 0;
  double diffMaterialCoast = 0;
  double diffYarnCoast = 0;
  double diffProfitLoss = 0;

  //Calculator 1
  final yarnCount = TextEditingController();
  final cottonRate = TextEditingController();
  final yield = TextEditingController();
  final wasteRecovery = TextEditingController();
  final conversationCoast = TextEditingController();
  final commission = TextEditingController();
  final otherExpense = TextEditingController();
  final yarnRate = TextEditingController();

  //Calculator 2
  final yarnCount2 = TextEditingController();
  final cottonRate2 = TextEditingController();
  final yield2 = TextEditingController();
  final wasteRecovery2 = TextEditingController();
  final conversationCoast2 = TextEditingController();
  final commission2 = TextEditingController();
  final otherExpense2 = TextEditingController();
  final yarnRate2 = TextEditingController();

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
      ansProfitLoss = double.parse(j.toStringAsFixed(2));

      double temp = answerCottonRate - answerCottonRate2;
      diffCottonRate = double.parse(temp.toStringAsFixed(2));

      double temp2 = ansMatrialCoast - ansMatrialCoast2;
      diffMaterialCoast = double.parse(temp2.toStringAsFixed(2));

      double temp3 = ansYarnCoast - ansYarnCoast2;
      diffYarnCoast = double.parse(temp3.toStringAsFixed(2));

      double temp4 = ansProfitLoss - ansProfitLoss2;
      diffProfitLoss = double.parse(temp4.toStringAsFixed(2));
    });
  }

  void _cottonRate2() {
    double storeYarnCount = double.tryParse(yarnCount2.text) ?? 0;
    double storecottonRate = double.tryParse(cottonRate2.text) ?? 0;
    double storeYeild = double.tryParse(yield2.text) ?? 0;
    double storeWasteRecovery = double.tryParse(wasteRecovery2.text) ?? 0;
    double storeConversationCoast =
        double.tryParse(conversationCoast2.text) ?? 0;
    double storeCommission = double.tryParse(commission2.text) ?? 0;
    double storeOtherExpense = double.tryParse(otherExpense2.text) ?? 0;
    double storeYarnRate = double.tryParse(yarnRate2.text) ?? 0;

    double a = storecottonRate / 355.60; //160.29
    double b = a / storeYeild * 100; //242.86
    double c = b - storeWasteRecovery; //182.86
    double d = storeYarnCount * storeConversationCoast; //60
    double e = c + d; //242.86
    double f = c * storeCommission / 100; //1.82
    double h = e + f; //244.68
    double i = h + storeOtherExpense; //249.68
    double j = i - storeYarnRate;

    setState(() {
      answerCottonRate2 = double.parse(a.toStringAsFixed(2));
      ansMatrialCoast2 = double.parse(c.toStringAsFixed(2));
      ansYarnCoast2 = double.parse(i.toStringAsFixed(2));
      ansProfitLoss2 = double.parse(j.toStringAsFixed(2));

      double temp = answerCottonRate - answerCottonRate2;
      diffCottonRate = double.parse(temp.toStringAsFixed(2));

      double temp2 = ansMatrialCoast - ansMatrialCoast2;
      diffMaterialCoast = double.parse(temp2.toStringAsFixed(2));

      double temp3 = ansYarnCoast - ansYarnCoast2;
      diffYarnCoast = double.parse(temp3.toStringAsFixed(2));

      double temp4 = ansProfitLoss - ansProfitLoss2;
      diffProfitLoss = double.parse(temp4.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Screenshot(
        controller: screenshotController,
        child: Scaffold(
            appBar: const AppbarWithText(
              appbarText: 'Spinning Compare',
              centerTitle: false,
              isBackButton: false,
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                //Heading of Calculator
                const GlobalRowCompareWidget2TEXT(
                  title1: 'Calc1',
                  title2: 'Calc2',
                ),

                //Content Of Calculator

                // Yarn Count
                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Yarn Count',
                    controller1: yarnCount,
                    subtitle: 'Count',
                    height: 0,
                    width: 0,
                    controller2: yarnCount2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),

                //Cotton Rate
                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Cotton Rate',
                    controller1: cottonRate,
                    subtitle: '₹/Candy',
                    height: 0,
                    width: 0,
                    controller2: cottonRate2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),

                //Answer Cotton Rate
                GlobalRowCompareWidget2StreamBuilderWithAnswer(
                  result1: answerCottonRate,
                  result2: answerCottonRate2,
                  subtext1: '₹/Kg',
                  subtext2: '₹/Kg',
                  title1: 'Cotton Rate',
                  title2: 'Cotton Rate',
                ),

                //Yeild
                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Yield',
                    controller1: yield,
                    subtitle: '%',
                    height: 0,
                    width: 0,
                    controller2: yield2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),

                //Waste Recovery
                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Waste Recovery',
                    controller1: wasteRecovery,
                    subtitle: '₹/Kg',
                    height: 0,
                    width: 0,
                    controller2: wasteRecovery2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),

                //answer waste recovery
                GlobalRowCompareWidget2StreamBuilderWithAnswer(
                  result1: ansMatrialCoast,
                  result2: ansMatrialCoast2,
                  subtext1: '₹/Kg',
                  subtext2: '₹/Kg',
                  title1: 'Material Coast',
                  title2: 'Material Coast',
                ),

                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Coversion Coast',
                    controller1: conversationCoast,
                    subtitle: '₹/Kg/Count',
                    height: 0,
                    width: 0,
                    controller2: conversationCoast2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),
                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Commission',
                    controller1: commission,
                    subtitle: '%',
                    height: 0,
                    width: 0,
                    controller2: commission2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),
                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Other Expenses',
                    controller1: otherExpense,
                    subtitle: '₹/Kg',
                    height: 0,
                    width: 0,
                    controller2: otherExpense2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),

                // Final Answer
                GlobalRowCompareWidget2StreamBuilderWithAnswer(
                  result1: ansYarnCoast,
                  result2: ansYarnCoast2,
                  subtext1: '₹/Kg',
                  subtext2: '₹/Kg',
                  title1: 'Yarn Coast',
                  title2: 'Yarn Coast',
                ),

                GlobalRowCompareWidget2textfielsWithOnchanges(
                    title: 'Yarn Rate',
                    controller1: yarnRate,
                    subtitle: '₹/Kg',
                    height: 0,
                    width: 0,
                    controller2: yarnRate2,
                    onchaned1: (string) {
                      _cottonRate();
                    },
                    onchane2: (string) {
                      _cottonRate2();
                    }),

                GlobalRowCompareWidget2StreamBuilderWithAnswer(
                  result1: ansProfitLoss,
                  result2: ansProfitLoss2,
                  subtext1: '₹/Kg',
                  subtext2: '₹/Kg',
                  title1: 'Profit/Loss',
                  title2: '',
                ),
                // // Khandi Diffrnce or Stram result

                GlobalRowCompareWidget2Button(
                  onpressed1: () {
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
                  onpressed2: () {
                    yarnCount2.clear();
                    cottonRate2.clear();
                    yield2.clear();
                    wasteRecovery2.clear();
                    conversationCoast2.clear();
                    commission2.clear();
                    otherExpense2.clear();
                    yarnRate2.clear();
                    //For Calulator 2 Answer
                    setState(() {
                      answerCottonRate2 = 0;
                      ansMatrialCoast2 = 0;
                      ansYarnCoast2 = 0;
                      ansProfitLoss2 = 0;
                    });
                  },
                  text1: 'RESET 1',
                  text2: 'RESET 2',
                ),

                //Cotton Rate Difference
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Cotton Rate Difference',
                  result: diffCottonRate.abs(),
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Material Coast Difference',
                  result: diffMaterialCoast.abs(),
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Yarn Coast Difference',
                  result: diffYarnCoast.abs(),
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹/Kg',
                  streamtitletext: 'Profit/Loss Difference',
                  result: diffProfitLoss.abs(),
                ),
                //

                SizedBox(height: 20.h),

                // Rseet All Button
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
                    yarnCount2.clear();
                    cottonRate2.clear();
                    yield2.clear();
                    wasteRecovery2.clear();
                    conversationCoast2.clear();
                    commission2.clear();
                    otherExpense2.clear();
                    yarnRate2.clear();
                    setState(() {
                      answerCottonRate = 0;
                      ansMatrialCoast = 0;
                      ansYarnCoast = 0;
                      ansProfitLoss = 0;
                      answerCottonRate2 = 0;
                      ansMatrialCoast2 = 0;
                      ansYarnCoast2 = 0;
                      ansProfitLoss2 = 0;
                      diffCottonRate = 0;
                      diffMaterialCoast = 0;
                      diffYarnCoast = 0;
                      diffProfitLoss = 0;
                    });
                  },
                  buttontext: 'Reset All',
                  height: globalSingalResetButtonHeight,
                  width: globalSingalResetButtonWidth,
                ),
              ],
            ),
            floatingActionButton: FloatingButton(
              screenshotController: screenshotController,
              isVisible: keyboardIsOpened,
            )));
  }
}
