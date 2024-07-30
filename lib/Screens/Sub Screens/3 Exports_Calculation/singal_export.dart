import 'package:flutter/material.dart';
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
import '../../../Constants/Global_Widgets/Switch/switch_with_two_text.dart';
import 'compare_export.dart';

bool calulateUSD = false;

final cottonRate = TextEditingController();
final expense = TextEditingController();
final exchangeRate = TextEditingController();
final exportRateCents = TextEditingController();
final exportRateUSD = TextEditingController();

double answerExportCents = 0;
double answerExportUSD = 0;
double answerReverseExportCents = 0;
double answerReverseExportUSD = 0;

class HomeExportCalculation extends StatefulWidget {
  const HomeExportCalculation({Key? key}) : super(key: key);

  @override
  State<HomeExportCalculation> createState() => _HomeExportCalculationState();
}

class _HomeExportCalculationState extends State<HomeExportCalculation>
    with SingleTickerProviderStateMixin {
  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'export_screen');
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setPageName();
  }

  ScreenshotController screenshotController = ScreenshotController();
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
                titleText: 'Export Calculator',
                sliderText1: 'Forward',
                sliderText2: 'Reverse',
                isBackButton: true,
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
      ),
    );
  }
}

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
      });
    } else if (storeCottonRate != 0 &&
        storeExpense != 0 &&
        storeExchangeRate == 0) {
      setState(() {
        answerExportCents = double.parse(sum.toStringAsFixed(2));
        answerExportUSD = double.parse(a.toStringAsFixed(2));
      });
    } else if (storeCottonRate != 0 &&
        storeExpense != 0 &&
        storeExchangeRate != 0) {
      setState(() {
        answerExportCents = double.parse(d.toStringAsFixed(2));
        answerExportUSD = double.parse(b.toStringAsFixed(2));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Cotton Rate',
          controller: cottonRate,
          subtitle: '₹/Candy',
          onchaned: (string) {
            _exportForward();
          },
        ),

        // Expenses
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Expenses',
          controller: expense,
          subtitle: '₹/Candy',
          onchaned: (string) {
            _exportForward();
          },
        ),

        // Cotton Seed
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Exchange Rate',
          controller: exchangeRate,
          subtitle: 'USD/INR',
          onchaned: (string) {
            _exportForward();
          },
        ),

        // Stram result Export Rate 1
        GlobalResultBuilderForResults(
          substreamtext: 'Cents/LB',
          streamtitletext: 'Export Rate',
          result: answerExportCents,
        ),

        // Stram result Export Rate 2
        GlobalResultBuilderForResults(
          substreamtext: 'USD/Kg',
          streamtitletext: 'Export Rate',
          result: answerExportUSD,
        ),

        // Reset Button
        GlobalButtonSimpleText(
          onPressed: () {
            cottonRate.clear();
            expense.clear();
            exchangeRate.clear();
            setState(() {
              answerExportCents = 0;
              answerExportUSD = 0;
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
            CompareExport(
              isReverse: 0,
              compareReverseCalculateUSD: calulateUSD,
            ),
          ),
          buttontext: 'Compare',
          height: globalSingalComareButtonHeight,
          width: globalSingalComareButtonWidth,
        ),
      ],
    );
  }
}

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

    if (calulateUSD) {
      double extra = storeExportRateUSD + storeExpense;
      double a = storeExportRateUSD * storeExchangeRate;
      double b = a * 355.60;
      double c = b - storeExpense;

      if (storeExportRateCents != 0 &&
          storeExpense == 0 &&
          storeExchangeRate == 0) {
        setState(() {
          answerReverseExportUSD =
              double.parse(storeExportRateUSD.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate == 0) {
        setState(() {
          answerReverseExportUSD = double.parse(extra.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate != 0) {
        setState(() {
          answerReverseExportUSD = double.parse(c.toStringAsFixed(2));
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
          answerReverseExportCents = double.parse(a.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate == 0) {
        setState(() {
          answerReverseExportCents = double.parse(b.toStringAsFixed(2));
        });
      } else if (storeExportRateCents != 0 &&
          storeExpense != 0 &&
          storeExchangeRate != 0) {
        setState(() {
          answerReverseExportCents = double.parse(e.toStringAsFixed(2));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        calulateUSD
            ? GlobalRowWidgetWithOnchanged(
                height: globalSingalTextfiedHeight,
                width: globalSingalTextfiedWidth,
                title: 'Export Rate',
                controller: exportRateUSD,
                subtitle: 'USD/Kg',
                onchaned: (string) {
                  _exportReverse();
                },
              )
            : GlobalRowWidgetWithOnchanged(
                height: globalSingalTextfiedHeight,
                width: globalSingalTextfiedWidth,
                title: 'Export Rate',
                controller: exportRateCents,
                subtitle: 'Cents/LB',
                onchaned: (string) {
                  _exportReverse();
                },
              ),

        // Expenses
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Expenses',
          controller: expense,
          subtitle: '₹/Candy',
          onchaned: (string) {
            _exportReverse();
          },
        ),

        // Cotton Seed
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Exchange Rate',
          controller: exchangeRate,
          subtitle: 'USD/INR',
          onchaned: (string) {
            _exportReverse();
          },
        ),

        // Stram result Export Rate 1
        GlobalResultBuilderForResults(
          substreamtext: '₹/Candy',
          streamtitletext: 'Realisation',
          result:
              calulateUSD ? answerReverseExportUSD : answerReverseExportCents,
        ),

        // Reset Button
        GlobalButtonSimpleText(
          onPressed: () {
            calulateUSD ? exportRateUSD.clear() : exportRateCents.clear();
            expense.clear();
            exchangeRate.clear();
            setState(() {
              calulateUSD
                  ? answerReverseExportUSD = 0
                  : answerReverseExportCents = 0;
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
            CompareExport(
              isReverse: 1,
              compareReverseCalculateUSD: calulateUSD,
            ),
          ),
          buttontext: 'Compare',
          height: globalSingalComareButtonHeight,
          width: globalSingalComareButtonWidth,
        ),

        SwitchWithTwoText(
            frontText: 'Cents/LB',
            backText: 'USD/Kg',
            onChange: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                calulateUSD = value;
              });
            },
            switchValue: calulateUSD,
            bigText: true),
      ],
    );
  }
}
