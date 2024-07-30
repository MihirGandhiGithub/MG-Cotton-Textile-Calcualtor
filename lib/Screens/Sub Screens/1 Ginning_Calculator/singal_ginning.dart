import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_slider.dart';
import '../../../Constants/Global_Widgets/Buttons/floating_share.dart';
import '../../../Constants/Global_Widgets/Buttons/gradient_text.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/Switch/switch_with_two_text.dart';
import '../../../Constants/Global_Widgets/navigate_page_with_animation.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/Row/three_content.dart';
import '../../../StageManagementClass/provider_state_management.dart';
import 'compare_ginning.dart';
import 'package:provider/provider.dart';

double answer = 0;
double answerMaund = 0;
double reverseanswer = 0;
double reverseanswerMaund = 0;

// for focusing  a node
FocusNode focusnodekapas1 = FocusNode();

final inputkapas1 = TextEditingController();
final inputexpense1 = TextEditingController();
final inputexpensePercetnage1 = TextEditingController();
final inputkapasia1 = TextEditingController();
final inpututaro1 = TextEditingController();
final inputghati1 = TextEditingController();

// For Quintal
final inputQuintalexpense1 = TextEditingController();
final inputQuintalkapas1 = TextEditingController();
final inputQuintalCotseed1 = TextEditingController();
double quintalanswer = 0;
double quintalanswerMaund = 0;

final reverseinputkapas1 = TextEditingController();
final reverseinputexpense1 = TextEditingController();
final reverseinputexpensePercetnage1 = TextEditingController();
final reverseinputkapasia1 = TextEditingController();
final reverseinpututaro1 = TextEditingController();
final reverseinputghati1 = TextEditingController();

// For Quintal
final reverseinputQuintalexpense1 = TextEditingController();
final reverseinputQuintalkapas1 = TextEditingController();
final reverseinputQuintalCotseed1 = TextEditingController();
double reverseQuintalanswer = 0;
double reverseQuintalanswerMaund = 0;
ScreenshotController screenshotController = ScreenshotController();

class HomeSingalGinningCalculator extends StatefulWidget {
  const HomeSingalGinningCalculator({Key? key}) : super(key: key);

  @override
  State<HomeSingalGinningCalculator> createState() =>
      _HomeSingalGinningCalculatorState();
}

class _HomeSingalGinningCalculatorState
    extends State<HomeSingalGinningCalculator>
    with SingleTickerProviderStateMixin {
  ScreenshotController screenshotController = ScreenshotController();
  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'ginning_screen');
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setPageName();
  }

  @override
  Widget build(BuildContext context) {
    var selectedValue = Provider.of<DropdownState>(context).selectedValue;
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
                titleText: 'Ginning Calculator',
                sliderText1: 'Forward',
                sliderText2: 'Reverse',
                isBackButton: true,
              ),
              body: TabBarView(
                children: [
                  selectedValue == 'All in one'
                      ? AllinOneGinningForward()
                      : GinningForward(),
                  selectedValue == 'All in one'
                      ? AllinOneGinningReverse()
                      : GinningReverse(),
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

class AllinOneGinningForward extends StatefulWidget {
  const AllinOneGinningForward({super.key});

  @override
  State<AllinOneGinningForward> createState() => _AllinOneGinningForwardState();
}

class _AllinOneGinningForwardState extends State<AllinOneGinningForward> {
  bool isQuintal = false;
  void _updateValuesForCalculator1() {
    double storeInputKapas1 = double.tryParse(inputkapas1.text) ?? 0;
    double storeinputexpensePercetnage1 =
        double.tryParse(inputexpensePercetnage1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(inputexpense1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(inputkapasia1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(inputghati1.text) ?? 0;
    double percentexpense =
        (storeInputKapas1 * storeinputexpensePercetnage1) / 100;
    double sum1 = (storeInputKapas1 + storeInputExpense1 + percentexpense);

    double a = sum1 * 100;
    double b = 100 - storeInputUtaro1 - storeInputGhati1;
    double c = storeInputKapasia1 * b;
    double d = a - c;
    double e = d / storeInputUtaro1;
    double f = e * 17.78;

    //For Maund
    double maund = f / 9.53;

    setState(() {
      answer = double.parse(f.toStringAsFixed(2));
      answerMaund = double.parse(maund.toStringAsFixed(2));
    });
  }

  void _updateValuesForQuintalCalculator1() {
    double storeInputKapas1 = double.tryParse(inputQuintalkapas1.text) ?? 0;
    double storeinputexpensePercetnage1 =
        double.tryParse(inputexpensePercetnage1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(inputQuintalexpense1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(inputQuintalCotseed1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(inputghati1.text) ?? 0;
    double percentexpense =
        ((storeInputKapas1 / 5) * storeinputexpensePercetnage1) / 100;
    double sum1 =
        ((storeInputKapas1 / 5) + (storeInputExpense1 / 5) + percentexpense);

    double a = sum1 * 100;
    double b = 100 - storeInputUtaro1 - storeInputGhati1;
    double c = (storeInputKapasia1 / 5) * b;
    double d = a - c;
    double e = d / storeInputUtaro1;
    double f = e * 17.78;

    //For Maund
    double maund = f / 9.53;

    setState(() {
      quintalanswer = double.parse(f.toStringAsFixed(2));
      quintalanswerMaund = double.parse(maund.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectedValue = Provider.of<DropdownState>(context).selectedValue;
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        isQuintal
            ? ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  // Page Main Content
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Kapas Rate',
                    controller: inputQuintalkapas1,
                    subtitle: '₹/Quintal',
                    onchaned: (string) {
                      _updateValuesForQuintalCalculator1();
                    },
                  ),

                  // Expense in Ruppes
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses',
                    controller: inputQuintalexpense1,
                    subtitle: '₹/Quintal',
                    onchaned: (string) {
                      _updateValuesForQuintalCalculator1();
                    },
                  ),

                  //Expenses in Percatage
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses %',
                    controller: inputexpensePercetnage1,
                    subtitle: '%',
                    onchaned: (string) {
                      _updateValuesForQuintalCalculator1();
                    },
                  ),

                  // Cotton Seed
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Cotton Seed',
                    controller: inputQuintalCotseed1,
                    subtitle: '₹/Quintal',
                    onchaned: (string) {
                      _updateValuesForQuintalCalculator1();
                    },
                  ),

                  // Out Turn / Utaro
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Out Turn',
                    controller: inpututaro1,
                    subtitle: '%',
                    onchaned: (string) {
                      _updateValuesForQuintalCalculator1();
                    },
                  ),

                  // Shortage / Ghati
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Shortage',
                    controller: inputghati1,
                    subtitle: '%',
                    onchaned: (string) {
                      _updateValuesForQuintalCalculator1();
                    },
                  ),

                  SizedBox(height: 30.h),

                  // Stram result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Quintal',
                    streamtitletext: 'Cotton Cost',
                    result: quintalanswer,
                  ),

                  //Maund Result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Cotton Cost',
                    result: quintalanswerMaund,
                  ),

                  // Reset Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      inputQuintalkapas1.clear();
                      inputQuintalexpense1.clear();
                      inputexpensePercetnage1.clear();
                      inputQuintalCotseed1.clear();
                      inputQuintalCotseed1.clear();
                      inputghati1.clear();
                      setState(() {
                        quintalanswer = 0;

                        quintalanswerMaund = 0;
                      });

                      // focusnodekapas1.requestFocus();
                    },
                    buttontext: 'Reset',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),

                  //Compare Button
                  GlobalButtonGradientText(
                    onPressed: () => CustomNavigator().navigateToPage(
                      context,
                      const CompareGinningCaculator(
                        isReverse: 0,
                        isQuintal: true,
                        reverseisQuintal: false,
                      ),
                    ),
                    buttontext: 'Compare',
                    height: globalSingalComareButtonHeight,
                    width: globalSingalComareButtonWidth,
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  // Page Main Content
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Kapas Rate',
                    controller: inputkapas1,
                    subtitle: '₹/20kg',
                    onchaned: (string) {
                      _updateValuesForCalculator1();
                    },
                  ),

                  //Expenses in Percatage
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

                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses %',
                    controller: inputexpensePercetnage1,
                    subtitle: '%',
                    onchaned: (string) {
                      _updateValuesForCalculator1();
                    },
                  ),

                  // Cotton Seed
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Cotton Seed',
                    controller: inputkapasia1,
                    subtitle: '₹/20kg',
                    onchaned: (string) {
                      _updateValuesForCalculator1();
                    },
                  ),

                  // Out Turn / Utaro
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Out Turn',
                    controller: inpututaro1,
                    subtitle: '%',
                    onchaned: (string) {
                      _updateValuesForCalculator1();
                    },
                  ),

                  // Shortage / Ghati
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Shortage',
                    controller: inputghati1,
                    subtitle: '%',
                    onchaned: (string) {
                      _updateValuesForCalculator1();
                    },
                  ),

                  SizedBox(height: 30.h),

                  // Stram result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Candy',
                    streamtitletext: 'Cotton Cost',
                    result: answer,
                  ),

                  //Maund Result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Cotton Cost',
                    result: answerMaund,
                  ),

                  // Reset Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      inputkapas1.clear();
                      inputexpense1.clear();
                      inputexpensePercetnage1.clear();
                      inputkapasia1.clear();
                      inpututaro1.clear();
                      inputghati1.clear();
                      setState(() {
                        answer = 0;
                        answerMaund = 0;
                      });
                      //
                      // focusnodekapas1.requestFocus();
                    },
                    buttontext: 'Reset',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),

                  //Compare Button
                  GlobalButtonGradientText(
                    onPressed: () => CustomNavigator().navigateToPage(
                      context,
                      const CompareGinningCaculator(
                        isReverse: 0,
                        isQuintal: false,
                        reverseisQuintal: false,
                      ),
                    ),
                    buttontext: 'Compare',
                    height: globalSingalComareButtonHeight,
                    width: globalSingalComareButtonWidth,
                  ),
                ],
              ),
        SwitchWithTwoText(
            frontText: '₹/20kg',
            backText: '₹/Quintal',
            onChange: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                isQuintal = value;
              });
            },
            switchValue: isQuintal,
            bigText: true),
      ],
    );
  }
}

class GinningForward extends StatefulWidget {
  const GinningForward({super.key});

  @override
  State<GinningForward> createState() => _GinningForwardState();
}

class _GinningForwardState extends State<GinningForward> {
  bool isQuintal = false;

  void _updateValuesForQuintalCalculator1() {
    double storeInputKapas1 = double.tryParse(inputQuintalkapas1.text) ?? 0;
    double storeinputexpensePercetnage1 =
        double.tryParse(inputexpensePercetnage1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(inputQuintalexpense1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(inputQuintalCotseed1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(inputghati1.text) ?? 0;

    double percentexpense =
        ((storeInputKapas1 / 5) * storeinputexpensePercetnage1) / 100;
    double sum1 =
        ((storeInputKapas1 / 5) + (storeInputExpense1 / 5) + percentexpense);

    double a = sum1 * 100;
    double b = 100 - storeInputUtaro1 - storeInputGhati1;
    double c = (storeInputKapasia1 / 5) * b;
    double d = a - c;
    double e = d / storeInputUtaro1;
    double f = e * 17.78;

    //For Maund
    double maund = f / 9.53;

    setState(() {
      quintalanswer = double.parse(f.toStringAsFixed(2));
      quintalanswerMaund = double.parse(maund.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    var dropDownValue = Provider.of<DropdownState>(context).selectedValue;

    final bool isAndhraPradesh = dropDownValue == 'Andhra Pradesh';
    final bool isGujarat = dropDownValue == 'Gujarat';
    final bool isKarnataka = dropDownValue == 'Karnataka';
    final bool isLowerRajsthan = dropDownValue == 'Lower Rajasthan';
    final bool isMadhyaPradesh = dropDownValue == 'Madhya Pradesh';
    final bool isMaharashtra = dropDownValue == 'Maharashtra';
    final bool isNorthZone = dropDownValue == 'North Zone';
    final bool isTelengana = dropDownValue == 'Telangana';
    void _updateValuesForCalculator1() {
      double storeInputKapas1 = double.tryParse(inputkapas1.text) ?? 0;
      double storeinputexpensePercetnage1 =
          double.tryParse(inputexpensePercetnage1.text) ?? 0;
      double storeInputExpense1 = double.tryParse(inputexpense1.text) ?? 0;
      double storeInputKapasia1 = double.tryParse(inputkapasia1.text) ?? 0;
      double storeInputUtaro1 = double.tryParse(inpututaro1.text) ?? 0;
      double storeInputGhati1 = double.tryParse(inputghati1.text) ?? 0;

      double percentexpense = isGujarat
          ? ((storeInputKapas1 * storeinputexpensePercetnage1) / 100)
          : isMaharashtra
              ? (((storeInputKapas1 / 5) * storeinputexpensePercetnage1) / 100)
              : (((storeInputKapas1 / 5) * storeinputexpensePercetnage1) / 100);
      double sum1 = 0;
      if (isGujarat)
        sum1 = (storeInputKapas1 + storeInputExpense1 + percentexpense);
      if (isMaharashtra || isNorthZone || isLowerRajsthan)
        sum1 = ((storeInputKapas1 / 5) +
            (storeInputExpense1 / 5) +
            percentexpense);
      if (isTelengana || isMadhyaPradesh || isAndhraPradesh || isKarnataka)
        sum1 = ((storeInputKapas1 / 5) + percentexpense);

      double a = sum1 * 100;

      double b = 100 - storeInputUtaro1 - storeInputGhati1;
      double c = isGujarat
          ? (storeInputKapasia1 * b)
          : isMaharashtra
              ? ((storeInputKapasia1 / 5) * b)
              : ((storeInputKapasia1 / 5) * b);
      double d = a - c;
      double e = d / storeInputUtaro1;
      double f = 0;
      if (isGujarat || isMaharashtra || isNorthZone || isLowerRajsthan)
        f = e * 17.78;
      if (isTelengana || isMadhyaPradesh || isAndhraPradesh || isKarnataka)
        f = (e * 17.78) + storeInputExpense1;

      print('the F is >>>>>>>> $f \n \n');

      //For Maund
      double maund = f / 9.53;

      setState(() {
        answer = double.parse(f.toStringAsFixed(2));
        answerMaund = double.parse(maund.toStringAsFixed(2));
      });
    }

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            // Page Main Content
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Kapas Rate',
              controller: inputkapas1,
              subtitle: isGujarat ? '₹/20kg' : '₹/Quintal',
              onchaned: (string) {
                _updateValuesForCalculator1();
              },
            ),

            //Expenses
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Expenses',
              controller: inputexpense1,
              subtitle: isGujarat
                  ? '₹/20kg'
                  : isMaharashtra
                      ? '₹/Quintal'
                      : isNorthZone
                          ? '₹/Quintal'
                          : isLowerRajsthan
                              ? '₹/Quintal'
                              : '₹/Candy',
              onchaned: (string) {
                _updateValuesForCalculator1();
              },
            ),

            //Expense in Persantage
            if (isNorthZone || isLowerRajsthan)
              GlobalRowWidgetWithOnchanged(
                height: globalSingalTextfiedHeight,
                width: globalSingalTextfiedWidth,
                title: 'Expenses %',
                controller: inputexpensePercetnage1,
                subtitle: '%',
                onchaned: (string) {
                  _updateValuesForCalculator1();
                },
              ),

            // Cotton Seed
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Cotton Seed',
              controller: inputkapasia1,
              subtitle: isGujarat ? '₹/20kg' : '₹/Quintal',
              onchaned: (string) {
                _updateValuesForCalculator1();
              },
            ),

            // Out Turn / Utaro
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Out Turn',
              controller: inpututaro1,
              subtitle: '%',
              onchaned: (string) {
                _updateValuesForCalculator1();
              },
            ),

            // Shortage / Ghati
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Shortage',
              controller: inputghati1,
              subtitle: '%',
              onchaned: (string) {
                _updateValuesForCalculator1();
              },
            ),

            SizedBox(height: 30.h),

            // Stram result
            if (!isNorthZone)
              GlobalResultBuilderForResults(
                substreamtext: '₹/Candy',
                streamtitletext: 'Cotton Cost',
                result: answer,
              ),

            //Maund Result
            if (isNorthZone)
              GlobalResultBuilderForResults(
                substreamtext: '₹/Maund',
                streamtitletext: 'Cotton Cost',
                result: answerMaund,
              ),

            // Reset Button
            GlobalButtonSimpleText(
              onPressed: () {
                inputkapas1.clear();
                inputexpense1.clear();
                inputexpensePercetnage1.clear();
                inputkapasia1.clear();
                inpututaro1.clear();
                inputghati1.clear();
                setState(() {
                  answer = 0;
                  answerMaund = 0;
                });
                //
                // focusnodekapas1.requestFocus();
              },
              buttontext: 'Reset',
              height: globalSingalResetButtonHeight,
              width: globalSingalResetButtonWidth,
            ),

            //Compare Button
            GlobalButtonGradientText(
              onPressed: () => CustomNavigator().navigateToPage(
                context,
                const CompareGinningCaculator(
                  isReverse: 0,
                  isQuintal: false,
                  reverseisQuintal: false,
                ),
              ),
              buttontext: 'Compare',
              height: globalSingalComareButtonHeight,
              width: globalSingalComareButtonWidth,
            ),
          ],
        ),
      ],
    );
  }
}

class AllinOneGinningReverse extends StatefulWidget {
  const AllinOneGinningReverse({super.key});

  @override
  State<AllinOneGinningReverse> createState() => _AllinOneGinningReverseState();
}

class _AllinOneGinningReverseState extends State<AllinOneGinningReverse> {
  bool isQuintal = false;
  void _reverseUpdateValuesForCalculator1() {
    double storeInputKapas1 = double.tryParse(reverseinputkapas1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(reverseinputexpense1.text) ?? 0;
    double storeInputPercentageExpense1 =
        double.tryParse(reverseinputexpensePercetnage1.text) ?? 0;

    double storeInputKapasia1 = double.tryParse(reverseinputkapasia1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(reverseinpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(reverseinputghati1.text) ?? 0;

    // double sum1 = (storeInputKapas1 + storeInputExpense1 + percentexpense);
    double a1 = (storeInputKapas1 * 0.2812 / 5);
    double a2 = a1 * storeInputUtaro1;
    double a3 = 100 - storeInputUtaro1 - storeInputGhati1;
    double a4 = a3 * storeInputKapasia1;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double percentexpense = (a6 * storeInputPercentageExpense1) / 100;
    double f = a6 - storeInputExpense1 - percentexpense;

    //For Maund
    double maund = storeInputKapas1 / 9.53;

    setState(() {
      reverseanswer = double.parse(f.toStringAsFixed(2));
      reverseanswerMaund = double.parse(maund.toStringAsFixed(2));
    });
  }

  void _reverseUpdateValuesForQuintalCalculator1() {
    double storeInputKapas1 = double.tryParse(reverseinputkapas1.text) ?? 0;
    double storeInputExpense1 =
        double.tryParse(reverseinputQuintalexpense1.text) ?? 0;
    double storeInputPercentageExpense1 =
        double.tryParse(reverseinputexpensePercetnage1.text) ?? 0;

    double storeInputKapasia1 =
        double.tryParse(reverseinputQuintalCotseed1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(reverseinpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(reverseinputghati1.text) ?? 0;

    // double sum1 = (storeInputKapas1 + storeInputExpense1 + percentexpense);
    double a1 = (storeInputKapas1 * 0.2812);

    double a2 = a1 * storeInputUtaro1;
    double a3 = 100 - storeInputUtaro1 - storeInputGhati1;
    double a4 = a3 * storeInputKapasia1;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double percentexpense = (a6 * storeInputPercentageExpense1) / 100;
    double f = a6 - storeInputExpense1 - percentexpense;

    //For Maund
    double maund = storeInputKapas1 / 9.53;

    setState(() {
      reverseQuintalanswer = double.parse(f.toStringAsFixed(2));
      reverseQuintalanswerMaund = double.parse(maund.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        isQuintal
            ? ListView(
                shrinkWrap: true,
                children: [
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Cotton Rate',
                    controller: reverseinputkapas1,
                    subtitle: '₹/Candy',
                    onchaned: (string) {
                      _reverseUpdateValuesForQuintalCalculator1();
                    },
                  ),

                  // Expense
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses',
                    controller: reverseinputQuintalexpense1,
                    subtitle: '₹/Quintal',
                    onchaned: (string) {
                      _reverseUpdateValuesForQuintalCalculator1();
                    },
                  ),
                  // Expense %
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses %',
                    controller: reverseinputexpensePercetnage1,
                    subtitle: '%',
                    onchaned: (value) {
                      _reverseUpdateValuesForQuintalCalculator1();
                    },
                  ),

                  // Cotton Seed
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Cotton Seed',
                    controller: reverseinputQuintalCotseed1,
                    subtitle: '₹/Quintal',
                    onchaned: (string) {
                      _reverseUpdateValuesForQuintalCalculator1();
                    },
                  ),

                  // Out Turn / Utaro
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Out Turn',
                    controller: reverseinpututaro1,
                    subtitle: '%',
                    onchaned: (string) {
                      _reverseUpdateValuesForQuintalCalculator1();
                    },
                  ),

                  // Shortage / Ghati
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Shortage',
                    controller: reverseinputghati1,
                    subtitle: '%',
                    onchaned: (string) {
                      _reverseUpdateValuesForQuintalCalculator1();
                    },
                  ),

                  SizedBox(height: 30.h),

                  // Stram result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Quintal',
                    streamtitletext: 'Kapas Coast',
                    result: reverseQuintalanswer,
                  ),

                  //Maund Result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Kapas Coast',
                    result: reverseQuintalanswerMaund,
                  ),

                  // Reset Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      reverseinputkapas1.clear();
                      reverseinputQuintalexpense1.clear();

                      reverseinputexpensePercetnage1.clear();
                      reverseinputQuintalCotseed1.clear();
                      reverseinpututaro1.clear();
                      reverseinputghati1.clear();

                      setState(() {
                        reverseQuintalanswer = 0;

                        reverseQuintalanswerMaund = 0;
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
                      const CompareGinningCaculator(
                        isReverse: 1,
                        isQuintal: false,
                        reverseisQuintal: true,
                      ),
                    ),
                    buttontext: 'Compare',
                    height: globalSingalComareButtonHeight,
                    width: globalSingalComareButtonWidth,
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
                children: [
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Cotton Rate',
                    controller: reverseinputkapas1,
                    subtitle: '₹/Candy',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Expense
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses',
                    controller: reverseinputexpense1,
                    subtitle: '₹/20kg',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),
                  // Expense %
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Expenses %',
                    controller: reverseinputexpensePercetnage1,
                    subtitle: '%',
                    onchaned: (value) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Cotton Seed
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Cotton Seed',
                    controller: reverseinputkapasia1,
                    subtitle: '₹/20kg',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Out Turn / Utaro
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Out Turn',
                    controller: reverseinpututaro1,
                    subtitle: '%',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  // Shortage / Ghati
                  GlobalRowWidgetWithOnchanged(
                    height: globalSingalTextfiedHeight,
                    width: globalSingalTextfiedWidth,
                    title: 'Shortage',
                    controller: reverseinputghati1,
                    subtitle: '%',
                    onchaned: (string) {
                      _reverseUpdateValuesForCalculator1();
                    },
                  ),

                  SizedBox(height: 30.h),

                  // Stram result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/20Kg',
                    streamtitletext: 'Kapas Coast',
                    result: reverseanswer,
                  ),

                  //Maund Result
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Kapas Coast',
                    result: reverseanswerMaund,
                  ),

                  // Reset Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      reverseinputkapas1.clear();
                      reverseinputexpense1.clear();
                      reverseinputexpensePercetnage1.clear();
                      reverseinputkapasia1.clear();
                      reverseinpututaro1.clear();
                      reverseinputghati1.clear();
                      setState(() {
                        reverseanswer = 0;

                        reverseanswerMaund = 0;
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
                      const CompareGinningCaculator(
                        isReverse: 1,
                        isQuintal: false,
                        reverseisQuintal: false,
                      ),
                    ),
                    buttontext: 'Compare',
                    height: globalSingalComareButtonHeight,
                    width: globalSingalComareButtonWidth,
                  ),
                ],
              ),
        SwitchWithTwoText(
            frontText: '₹/20kg',
            backText: '₹/Quintal',
            onChange: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                isQuintal = value;
              });
            },
            switchValue: isQuintal,
            bigText: true),
      ],
    );
  }
}

class GinningReverse extends StatefulWidget {
  const GinningReverse({super.key});

  @override
  State<GinningReverse> createState() => _GinningReverseState();
}

class _GinningReverseState extends State<GinningReverse> {
  @override
  Widget build(BuildContext context) {
    var dropDownValue = Provider.of<DropdownState>(context).selectedValue;

    final bool isAndhraPradesh = dropDownValue == 'Andhra Pradesh';
    final bool isGujarat = dropDownValue == 'Gujarat';
    final bool isKarnataka = dropDownValue == 'Karnataka';
    final bool isLowerRajsthan = dropDownValue == 'Lower Rajasthan';
    final bool isMadhyaPradesh = dropDownValue == 'Madhya Pradesh';
    final bool isMaharashtra = dropDownValue == 'Maharashtra';
    final bool isNorthZone = dropDownValue == 'North Zone';
    final bool isTelengana = dropDownValue == 'Telangana';

    void _reverseUpdateValuesForCalculator1() {
      double storeInputKapas1 = double.tryParse(reverseinputkapas1.text) ?? 0;
      double storeInputExpense1 =
          double.tryParse(reverseinputexpense1.text) ?? 0;
      double storeInputPercentageExpense1 =
          double.tryParse(reverseinputexpensePercetnage1.text) ?? 0;

      double storeInputKapasia1 =
          double.tryParse(reverseinputkapasia1.text) ?? 0;
      double storeInputUtaro1 = double.tryParse(reverseinpututaro1.text) ?? 0;
      double storeInputGhati1 = double.tryParse(reverseinputghati1.text) ?? 0;

      // double sum1 = (storeInputKapas1 + storeInputExpense1 + percentexpense);
      double a1 = 0;
      if (isGujarat) {
        a1 = (storeInputKapas1 * 0.2812 / 5);
      } else if (isNorthZone) {
        a1 = (storeInputKapas1 * 9.53 * 0.2812);
      } else {
        a1 = (storeInputKapas1 * 0.2812);
      }
      double a2 = a1 * storeInputUtaro1;
      double a3 = 100 - storeInputUtaro1 - storeInputGhati1;
      double a4 = a3 * storeInputKapasia1;
      double a5 = a4 + a2;
      double a6 = 0;
      // if(isGujarat)
      a6 = a5 / 100;
      double percentexpense = (a6 * storeInputPercentageExpense1) / 100;

      double f = 0;
      if (isMadhyaPradesh ||
          isMadhyaPradesh ||
          isAndhraPradesh ||
          isTelengana ||
          isKarnataka) {
        f = a6 - percentexpense - (storeInputExpense1 / 5);
      } else {
        f = a6 - storeInputExpense1 - percentexpense;
      }

      //For Maund
      double maund = storeInputKapas1 / 9.53;

      setState(() {
        reverseanswer = double.parse(f.toStringAsFixed(2));
        reverseanswerMaund = double.parse(maund.toStringAsFixed(2));
      });
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Cotton Rate',
              controller: reverseinputkapas1,
              subtitle: isNorthZone ? '₹/Maund' : '₹/Candy',
              onchaned: (string) {
                _reverseUpdateValuesForCalculator1();
              },
            ),

            // Expense
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Expenses',
              controller: reverseinputexpense1,
              subtitle: isGujarat
                  ? '₹/20kg'
                  : isMaharashtra
                      ? '₹/Quintal'
                      : isNorthZone
                          ? '₹/Quintal'
                          : isLowerRajsthan
                              ? '₹/Quintal'
                              : '₹/Candy',
              onchaned: (string) {
                _reverseUpdateValuesForCalculator1();
              },
            ),
            // Expense %
            if (isNorthZone || isLowerRajsthan)
              GlobalRowWidgetWithOnchanged(
                height: globalSingalTextfiedHeight,
                width: globalSingalTextfiedWidth,
                title: 'Expenses %',
                controller: reverseinputexpensePercetnage1,
                subtitle: '%',
                onchaned: (value) {
                  _reverseUpdateValuesForCalculator1();
                },
              ),

            // Cotton Seed
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Cotton Seed',
              controller: reverseinputkapasia1,
              subtitle: isGujarat ? '₹/20kg' : '₹/Quintal',
              onchaned: (string) {
                _reverseUpdateValuesForCalculator1();
              },
            ),

            // Out Turn / Utaro
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Out Turn',
              controller: reverseinpututaro1,
              subtitle: '%',
              onchaned: (string) {
                _reverseUpdateValuesForCalculator1();
              },
            ),

            // Shortage / Ghati
            GlobalRowWidgetWithOnchanged(
              height: globalSingalTextfiedHeight,
              width: globalSingalTextfiedWidth,
              title: 'Shortage',
              controller: reverseinputghati1,
              subtitle: '%',
              onchaned: (string) {
                _reverseUpdateValuesForCalculator1();
              },
            ),

            SizedBox(height: 30.h),

            // Stram result
            GlobalResultBuilderForResults(
              substreamtext: isGujarat ? '₹/20kg' : '₹/Quintal',
              streamtitletext: 'Kapas Coast',
              result: reverseanswer,
            ),

            //Maund Result
            Visibility(
              visible: false,
              child: GlobalResultBuilderForResults(
                substreamtext: '₹/Maund',
                streamtitletext: 'Kapas Coast',
                result: reverseanswerMaund,
              ),
            ),

            // Reset Button
            GlobalButtonSimpleText(
              onPressed: () {
                reverseinputkapas1.clear();
                reverseinputexpense1.clear();
                reverseinputexpensePercetnage1.clear();
                reverseinputkapasia1.clear();
                reverseinpututaro1.clear();
                reverseinputghati1.clear();
                setState(() {
                  reverseanswer = 0;

                  reverseanswerMaund = 0;
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
                const CompareGinningCaculator(
                  isReverse: 1,
                  isQuintal: false,
                  reverseisQuintal: false,
                ),
              ),
              buttontext: 'Compare',
              height: globalSingalComareButtonHeight,
              width: globalSingalComareButtonWidth,
            ),
          ],
        ),
      ],
    );
  }
}
