import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_slider.dart';
import '../../../Constants/Global_Widgets/Buttons/floating_share.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/Switch/switch_with_two_text.dart';
import '../../../Constants/Global_Widgets/row_with_2_item.dart';

final cottonRate = TextEditingController();
final expense = TextEditingController();
final exchangeRate = TextEditingController();

final cottonRate2 = TextEditingController();
final expense2 = TextEditingController();
final exchangeRate2 = TextEditingController();

final exportRateCents = TextEditingController();
final exportRateUSD = TextEditingController();

double answerReverseExportCents = 0;
double answerReverseExportUSD = 0;

final exportRateCents2 = TextEditingController();
final exportRateUSD2 = TextEditingController();
double answerReverseExportCents2 = 0;
double answerReverseExportUSD2 = 0;

double answerExportCents = 0;
double answerExportUSD = 0;
double answerExportCents2 = 0;
double answerExportUSD2 = 0;

double diffAnswerForwardUSD = 0;
double diffAnswerForwardCents = 0;

double diffAnswerReverseCents = 0;
double diffAnswerReverseUSD = 0;

double realizationCents1 = 0;
double realizationCents2 = 0;

double realizationUSD1 = 0;
double realizationUSD2 = 0;

late bool compareReverseCalulateMix;

class CompareExport extends StatefulWidget {
  final int isReverse;
  final bool compareReverseCalculateUSD;
  const CompareExport(
      {Key? key,
      required this.isReverse,
      required this.compareReverseCalculateUSD})
      : super(key: key);

  @override
  State<CompareExport> createState() => _CompareExportState();
}

class _CompareExportState extends State<CompareExport>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    compareReverseCalulateMix = widget.compareReverseCalculateUSD;
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return DefaultTabController(
      initialIndex: widget.isReverse,
      length: 2,
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
            appBar: const AppBarWithSlider(
              titleText: 'Export Compare',
              sliderText1: 'Forward',
              sliderText2: 'Reverse',
              isBackButton: false,
            ),
            body: const TabBarView(
              children: [
                ExportForward(),
                ExportReverse(),
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

// Forward Export
class ExportForward extends StatefulWidget {
  const ExportForward({super.key});

  @override
  State<ExportForward> createState() => _ExportForwardState();
}

class _ExportForwardState extends State<ExportForward> {
  void _exportForward() {
    double storeCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeExpense = double.tryParse(expense.text) ?? 0;
    double storeExchangeRate = double.tryParse(exchangeRate.text) ?? 0;

    double sum = storeCottonRate + storeExpense;
    double a = sum / 355.60;
    double b = a / storeExchangeRate;
    double c = b * 0.45359;
    double d = c * 100;

    if (storeCottonRate != 0 && storeExpense == 0 && storeExchangeRate == 0) {
      setState(() {
        answerExportCents = double.parse(storeCottonRate.toStringAsFixed(2));
        answerExportUSD = double.parse(storeCottonRate.toStringAsFixed(2));
        double temp = answerExportCents - answerExportCents2;
        diffAnswerForwardCents = double.parse(temp.toStringAsFixed(2));
        double temp2 = answerExportUSD - answerExportUSD2;
        diffAnswerForwardUSD = double.parse(temp2.toStringAsFixed(2));
      });
    } else if (storeCottonRate != 0 &&
        storeExpense != 0 &&
        storeExchangeRate == 0) {
      setState(() {
        answerExportCents = double.parse(sum.toStringAsFixed(2));
        answerExportUSD = double.parse(a.toStringAsFixed(2));
        double temp = answerExportCents - answerExportCents2;
        diffAnswerForwardCents = double.parse(temp.toStringAsFixed(2));
        double temp2 = answerExportUSD - answerExportUSD2;
        diffAnswerForwardUSD = double.parse(temp2.toStringAsFixed(2));
      });
    } else if (storeCottonRate != 0 &&
        storeExpense != 0 &&
        storeExchangeRate != 0) {
      setState(() {
        answerExportCents = double.parse(d.toStringAsFixed(2));
        answerExportUSD = double.parse(b.toStringAsFixed(2));
        double temp = answerExportCents - answerExportCents2;
        diffAnswerForwardCents = double.parse(temp.toStringAsFixed(2));
        double temp2 = answerExportUSD - answerExportUSD2;
        diffAnswerForwardUSD = double.parse(temp2.toStringAsFixed(2));
      });
    }
  }

  void _exportForward2() {
    double storeCottonRate = double.tryParse(cottonRate2.text) ?? 0;
    double storeExpense = double.tryParse(expense2.text) ?? 0;
    double storeExchangeRate = double.tryParse(exchangeRate2.text) ?? 0;

    double sum = storeCottonRate + storeExpense;
    double a = sum / 355.60;
    double b = a / storeExchangeRate;
    double c = b * 0.45359;
    double d = c * 100;

    if (storeCottonRate != 0 && storeExpense == 0 && storeExchangeRate == 0) {
      setState(() {
        answerExportCents2 = double.parse(storeCottonRate.toStringAsFixed(2));
        answerExportUSD2 = double.parse(storeCottonRate.toStringAsFixed(2));
        double temp = answerExportCents - answerExportCents2;
        diffAnswerForwardCents = double.parse(temp.toStringAsFixed(2));
        double temp2 = answerExportUSD - answerExportUSD2;
        diffAnswerForwardUSD = double.parse(temp2.toStringAsFixed(2));
      });
    } else if (storeCottonRate != 0 &&
        storeExpense != 0 &&
        storeExchangeRate == 0) {
      setState(() {
        answerExportCents2 = double.parse(sum.toStringAsFixed(2));
        answerExportUSD2 = double.parse(a.toStringAsFixed(2));
        double temp = answerExportCents - answerExportCents2;
        diffAnswerForwardCents = double.parse(temp.toStringAsFixed(2));
        double temp2 = answerExportUSD - answerExportUSD2;
        diffAnswerForwardUSD = double.parse(temp2.toStringAsFixed(2));
      });
    } else if (storeCottonRate != 0 &&
        storeExpense != 0 &&
        storeExchangeRate != 0) {
      setState(() {
        answerExportCents2 = double.parse(d.toStringAsFixed(2));
        answerExportUSD2 = double.parse(b.toStringAsFixed(2));
        double temp = answerExportCents - answerExportCents2;
        diffAnswerForwardCents = double.parse(temp.toStringAsFixed(2));
        double temp2 = answerExportUSD - answerExportUSD2;
        diffAnswerForwardUSD = double.parse(temp2.toStringAsFixed(2));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        //Heading of Calculator
        const GlobalRowCompareWidget2TEXT(
          title1: 'Calc1 ',
          title2: 'Calc2 ',
        ),

        //Content Of Calculator
        // Kappas

        GlobalRowCompareWidget2textfielsWithOnchanges(
            title: 'Cotton Rate',
            controller1: cottonRate,
            subtitle: 'Kappas',
            height: 0,
            width: 0,
            controller2: cottonRate2,
            onchaned1: (string) {
              _exportForward();
            },
            onchane2: (string) {
              _exportForward2();
            }),

        // Expense
        GlobalRowCompareWidget2textfielsWithOnchanges(
            title: 'Expenses',
            controller1: expense,
            subtitle: 'nothing',
            height: 0,
            width: 0,
            controller2: expense2,
            onchaned1: (string) {
              _exportForward();
            },
            onchane2: (string) {
              _exportForward2();
            }),

        // Cotton Seed
        GlobalRowCompareWidget2textfielsWithOnchanges(
            title: 'Exchnage Rate',
            controller1: exchangeRate,
            subtitle: 'Cotton Seed',
            height: 0,
            width: 0,
            controller2: exchangeRate2,
            onchaned1: (string) {
              _exportForward();
            },
            onchane2: (string) {
              _exportForward2();
            }),

        // Final Answer
        GlobalRowCompareWidget2StreamBuilderWithAnswer(
          result1: answerExportCents,
          result2: answerExportCents2,
          subtext1: 'Cents/LB',
          subtext2: 'Cents/LB',
          title1: 'Export Rate',
          title2: 'Export Rate',
        ),
        GlobalRowCompareWidget2StreamBuilderWithAnswer(
          result1: answerExportUSD,
          result2: answerExportUSD2,
          subtext1: 'USD/Kg',
          subtext2: 'USD/Kg',
          title1: 'Export Rate',
          title2: 'Export Rate',
        ),

        GlobalRowCompareWidget2Button(
          onpressed1: () {
            cottonRate.clear();
            expense.clear();
            exchangeRate.clear();
            setState(() {
              answerExportCents = 0;
              answerExportUSD = 0;
            });
          },
          onpressed2: () {
            cottonRate2.clear();
            expense2.clear();
            exchangeRate2.clear();
            setState(() {
              answerExportCents2 = 0;
              answerExportUSD2 = 0;
            });
          },
          text1: 'RESET 1',
          text2: 'RESET 2',
        ),
        //
        // // Khandi Diffrnce or Stram result
        SizedBox(height: 20.h),
        GlobalResultBuilderForResults(
          substreamtext: 'Cents/LB',
          streamtitletext: 'Export Rate Difference',
          result: diffAnswerForwardCents.abs(),
        ),

        SizedBox(height: 20.h),
        GlobalResultBuilderForResults(
          substreamtext: 'USD/Kg',
          streamtitletext: 'Export Rate Difference',
          result: diffAnswerForwardUSD.abs(),
        ),

        SizedBox(height: 20.h),
        // Rseet All Button
        GlobalButtonSimpleText(
          onPressed: () {
            cottonRate.clear();
            expense.clear();
            exchangeRate.clear();
            cottonRate2.clear();
            expense2.clear();
            exchangeRate2.clear();
            setState(() {
              answerExportCents = 0;
              answerExportUSD = 0;
              answerExportCents2 = 0;
              answerExportUSD2 = 0;
              diffAnswerForwardUSD = 0;
              diffAnswerForwardCents = 0;
            });
          },
          buttontext: 'Reset All',
          height: globalSingalResetButtonHeight,
          width: globalSingalResetButtonWidth,
        ),
      ],
    );
  }
}

//Reverse Export
class ExportReverse extends StatefulWidget {
  const ExportReverse({super.key});

  @override
  State<ExportReverse> createState() => _ExportReverseState();
}

class _ExportReverseState extends State<ExportReverse> {
  void _exportReverse() {
    double storeExportRateCents = double.tryParse(exportRateCents.text) ?? 0;
    double storeExportRateUSD = double.tryParse(exportRateUSD.text) ?? 0;
    double storeExpense = double.tryParse(expense.text) ?? 0;
    double storeExchangeRate = double.tryParse(exchangeRate.text) ?? 0;

    if (compareReverseCalulateMix) {
      double extra = storeExportRateUSD + storeExpense;
      double a = storeExportRateUSD * storeExchangeRate;
      double b = a * 355.60;
      double c = b - storeExpense;

      if (storeExportRateCents != 0 &&
          storeExpense == 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationUSD1 = double.parse(storeExportRateUSD.toStringAsFixed(2));
          double temp = realizationUSD1 - realizationUSD2;
          diffAnswerReverseUSD = double.parse(temp.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationUSD1 = double.parse(extra.toStringAsFixed(2));
          double temp = realizationUSD1 - realizationUSD2;
          diffAnswerReverseUSD = double.parse(temp.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate != 0) {
        setState(() {
          realizationUSD1 = double.parse(c.toStringAsFixed(2));
          double temp = realizationUSD1 - realizationUSD2;
          diffAnswerReverseUSD = double.parse(temp.toStringAsFixed(2));
        });
      }
    } else {
      double a = storeExportRateCents / 100;
      double b = a / 0.45359;
      double c = b * storeExchangeRate;
      double d = c * 355.60;
      double e = d - storeExpense;

      if (storeExportRateCents != 0 &&
          storeExpense == 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationCents1 = double.parse(a.toStringAsFixed(2));
          double temp = realizationCents1 - realizationCents2;
          diffAnswerReverseCents = double.parse(temp.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationCents1 = double.parse(b.toStringAsFixed(2));
          double temp = realizationCents1 - realizationCents2;
          diffAnswerReverseCents = double.parse(temp.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate != 0) {
        setState(() {
          realizationCents1 = double.parse(e.toStringAsFixed(2));
          double temp = realizationCents1 - realizationCents2;
          diffAnswerReverseCents = double.parse(temp.toStringAsFixed(2));
        });
      }
    }
  }

  void _exportReverse2() {
    double storeExportRateCents = double.tryParse(exportRateCents2.text) ?? 0;
    double storeExportRateUSD = double.tryParse(exportRateUSD2.text) ?? 0;
    double storeExpense = double.tryParse(expense2.text) ?? 0;
    double storeExchangeRate = double.tryParse(exchangeRate2.text) ?? 0;

    if (compareReverseCalulateMix) {
      double extra = storeExportRateUSD + storeExpense;
      double a = storeExportRateUSD * storeExchangeRate;
      double b = a * 355.60;
      double c = b - storeExpense;

      if (storeExportRateCents != 0 &&
          storeExpense == 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationUSD2 = double.parse(storeExportRateUSD.toStringAsFixed(2));
          double temp = realizationUSD1 - realizationUSD2;
          diffAnswerReverseUSD = double.parse(temp.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationUSD2 = double.parse(extra.toStringAsFixed(2));
          double temp = realizationUSD1 - realizationUSD2;
          diffAnswerReverseUSD = double.parse(temp.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate != 0) {
        setState(() {
          realizationUSD2 = double.parse(c.toStringAsFixed(2));
          double temp = realizationUSD1 - realizationUSD2;
          diffAnswerReverseUSD = double.parse(temp.toStringAsFixed(2));
        });
      }
    } else {
      double a = storeExportRateCents / 100;
      double b = a / 0.45359;
      double c = b * storeExchangeRate;
      double d = c * 355.60;
      double e = d - storeExpense;

      if (storeExportRateCents != 0 &&
          storeExpense == 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationCents2 = double.parse(a.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate == 0) {
        setState(() {
          realizationCents2 = double.parse(b.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate != 0) {
        setState(() {
          realizationCents2 = double.parse(e.toStringAsFixed(2));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        compareReverseCalulateMix
            ?
            // USD/Kg
            ListView(
                shrinkWrap: true,
                children: [
                  //Heading of Calculator
                  const GlobalRowCompareWidget2TEXT(
                    title1: 'Calc1',
                    title2: 'Calc2',
                  ),

                  //Content Of Calculator

                  // Kappas
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Export Rate USD',
                      controller1: exportRateUSD,
                      subtitle: 'USD/Kg',
                      height: 0,
                      width: 0,
                      controller2: exportRateUSD2,
                      onchaned1: (string) {
                        _exportReverse();
                      },
                      onchane2: (string) {
                        _exportReverse2();
                      }),

                  // Nothing
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses',
                      controller1: expense,
                      subtitle: '₹/Candy',
                      height: 0,
                      width: 0,
                      controller2: expense2,
                      onchaned1: (string) {
                        _exportReverse();
                      },
                      onchane2: (string) {
                        _exportReverse2();
                      }),

                  // Nothing
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Exchange Rate',
                      controller1: exchangeRate,
                      subtitle: 'USD/INR',
                      height: 0,
                      width: 0,
                      controller2: exchangeRate2,
                      onchaned1: (string) {
                        _exportReverse();
                      },
                      onchane2: (string) {
                        _exportReverse2();
                      }),

                  // Final Answer
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: realizationUSD1,
                    result2: realizationUSD2,
                    subtext1: '₹/Candy',
                    subtext2: '₹/Candy',
                    title1: 'Realisation',
                    title2: 'Realisation',
                  ),

                  GlobalRowCompareWidget2Button(
                    onpressed1: () {
                      exportRateUSD.clear();
                      expense.clear();
                      exchangeRate.clear();
                      setState(() {
                        realizationUSD1 = 0;
                      });
                    },
                    onpressed2: () {
                      exportRateUSD2.clear();
                      expense2.clear();
                      exchangeRate2.clear();
                      setState(() {
                        realizationUSD2 = 0;
                      });
                    },
                    text1: 'RESET 1',
                    text2: 'RESET 2',
                  ),

                  // Khandi Diffrnce or Stram result
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Candy',
                    streamtitletext: 'Realisation Difference',
                    result: diffAnswerReverseUSD.abs(),
                  ),

                  // Reset All Button
                  SizedBox(
                    height: 20.h,
                  ),
                  GlobalButtonSimpleText(
                    onPressed: () {
                      exportRateUSD.clear();
                      expense.clear();
                      exchangeRate.clear();
                      exportRateUSD2.clear();
                      expense2.clear();
                      exchangeRate2.clear();

                      setState(() {
                        realizationUSD1 = 0;
                        realizationUSD2 = 0;
                        diffAnswerReverseUSD = 0;
                      });
                    },
                    buttontext: 'Reset All',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),
                ],
              )

            //Cents/LB
            : ListView(
                shrinkWrap: true,
                children: [
                  //Heading of Calculator
                  const GlobalRowCompareWidget2TEXT(
                    title1: 'Calc1',
                    title2: 'Calc2',
                  ),

                  //Content Of Calculator

                  // Kappas
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Export Rate Cents',
                      controller1: exportRateCents,
                      subtitle: 'Cents/LB',
                      height: 0,
                      width: 0,
                      controller2: exportRateCents2,
                      onchaned1: (string) {
                        _exportReverse();
                      },
                      onchane2: (string) {
                        _exportReverse2();
                      }),

                  // Nothing
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses',
                      controller1: expense,
                      subtitle: '₹/Candy',
                      height: 0,
                      width: 0,
                      controller2: expense2,
                      onchaned1: (string) {
                        _exportReverse();
                      },
                      onchane2: (string) {
                        _exportReverse2();
                      }),

                  // Nothing
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Exchange Rate',
                      controller1: exchangeRate,
                      subtitle: 'USD/INR',
                      height: 0,
                      width: 0,
                      controller2: exchangeRate2,
                      onchaned1: (string) {
                        _exportReverse();
                      },
                      onchane2: (string) {
                        _exportReverse2();
                      }),

                  // Final Answer
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: realizationCents1,
                    result2: realizationCents2,
                    subtext1: '₹/Candy',
                    subtext2: '₹/Candy',
                    title1: 'Realisation',
                    title2: 'Realisation',
                  ),

                  GlobalRowCompareWidget2Button(
                    onpressed1: () {
                      exportRateCents.clear();
                      expense.clear();
                      exchangeRate.clear();
                      setState(() {
                        realizationCents1 = 0;
                      });
                    },
                    onpressed2: () {
                      exportRateCents2.clear();
                      expense2.clear();
                      exchangeRate2.clear();
                      setState(() {
                        realizationCents2 = 0;
                      });
                    },
                    text1: 'RESET 1',
                    text2: 'RESET 2',
                  ),

                  // Khandi Diffrnce or Stram result
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Candy',
                    streamtitletext: 'Realisation Difference',
                    result: diffAnswerReverseCents.abs(),
                  ),

                  // Reset All Button
                  SizedBox(
                    height: 20.h,
                  ),
                  GlobalButtonSimpleText(
                    onPressed: () {
                      exportRateCents.clear();
                      expense.clear();
                      exchangeRate.clear();
                      exportRateCents2.clear();
                      expense2.clear();
                      exchangeRate2.clear();
                      setState(() {
                        realizationCents1 = 0;
                        realizationCents2 = 0;
                        diffAnswerReverseCents = 0;
                      });
                    },
                    buttontext: 'Reset All',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),
                ],
              ),
        SwitchWithTwoText(
            frontText: 'Cents/LB',
            backText: 'USD/Kg',
            onChange: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                compareReverseCalulateMix = value;
              });
            },
            switchValue: compareReverseCalulateMix,
            bigText: true),
      ],
    );
  }
}
