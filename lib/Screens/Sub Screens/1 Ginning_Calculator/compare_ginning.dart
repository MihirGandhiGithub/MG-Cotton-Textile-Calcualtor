import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_slider.dart';
import '../../../Constants/Global_Widgets/Buttons/floating_share.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/Switch/switch_with_two_text.dart';
import '../../../Constants/Global_Widgets/row_with_2_item.dart';
import '../../../StageManagementClass/provider_state_management.dart';

bool? isQuintal;
bool? reverseisQuintal;

class CompareGinningCaculator extends StatefulWidget {
  final bool reverseisQuintal;
  final bool isQuintal;
  final int isReverse;
  const CompareGinningCaculator(
      {Key? key,
      required this.isReverse,
      required this.isQuintal,
      required this.reverseisQuintal})
      : super(key: key);

  @override
  State<CompareGinningCaculator> createState() =>
      _CompareGinningCaculatorState();
}

class _CompareGinningCaculatorState extends State<CompareGinningCaculator>
    with SingleTickerProviderStateMixin {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isQuintal = widget.isQuintal;
    reverseisQuintal = widget.reverseisQuintal;
  }

  @override
  Widget build(BuildContext context) {
    var selectedValue = Provider.of<DropdownState>(context).selectedValue;
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return DefaultTabController(
      initialIndex: widget.isReverse,
      length: 2,
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
            appBar: const AppBarWithSlider(
              titleText: 'Ginning Compare',
              sliderText1: 'Forward',
              sliderText2: 'Reverse',
              isBackButton: false,
            ),
            body: TabBarView(
              children: [
                selectedValue == 'All in one'
                    ? AllinOneForwardGinning()
                    : ForwardGinning(),
                selectedValue == 'All in one'
                    ? AllinOneReverseGinning()
                    : ReverseGinning(),
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

class AllinOneForwardGinning extends StatefulWidget {
  const AllinOneForwardGinning({super.key});

  @override
  State<AllinOneForwardGinning> createState() => _AllinOneForwardGinningState();
}

class _AllinOneForwardGinningState extends State<AllinOneForwardGinning> {
  // for calculator 1
  final inputkapas1 = TextEditingController();
  final inputexpense1 = TextEditingController();
  final inputexpensePercetnage1 = TextEditingController();
  final inputkapasia1 = TextEditingController();
  final inpututaro1 = TextEditingController();
  final inputghati1 = TextEditingController();
  double answer1 = 0;
  double dubanswer1 = 0;
  double maundanswer1 = 0;
  double maunddubanswer1 = 0;

  // For Quintal
  final inputQuintalexpense1 = TextEditingController();
  final inputQuintalkapas1 = TextEditingController();
  final inputQuintalCotseed1 = TextEditingController();

  //for calculator 2
  final inputkapas2 = TextEditingController();
  final inputexpense2 = TextEditingController();
  final inputexpensePercetnage2 = TextEditingController();
  final inputkapasia2 = TextEditingController();
  final inpututaro2 = TextEditingController();
  final inputghati2 = TextEditingController();
  double answer2 = 0;
  double dubanswer2 = 0;
  double maundanswer2 = 0;
  double maunddubanswer2 = 0;

  // For Quintal
  final inputQuintalexpense2 = TextEditingController();
  final inputQuintalkapas2 = TextEditingController();
  final inputQuintalCotseed2 = TextEditingController();

  //Difference
  double diff = 0;
  double dubdiff = 0;
  double maunnddiff = 0;
  double maunddubdiff = 0;

  double quintaldubanswer1 = 0;
  double quintalanswer1 = 0;
  double quintaldubdiff = 0;
  double quintaldiff = 0;

  double quintalMaunddubanswer1 = 0;
  double quintalMaundanswer1 = 0;
  double quintalMaunddubdiff = 0;
  double quintalMaunnddiff = 0;
  double quintaldubanswer2 = 0, quintalanswer2 = 0;
  double quintalMaunddubanswer2 = 0, quintalMaundanswer2 = 0;
  @override
  Widget build(BuildContext context) {
    void updateValueCalulator1() {
      double storeInputKapas1 = double.tryParse(inputkapas1.text) ?? 0;
      double storeInputExpense1 = double.tryParse(inputexpense1.text) ?? 0;
      double storeinputexpensePercetnage1 =
          double.tryParse(inputexpensePercetnage1.text) ?? 0;
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

      setState(() {
        dubanswer1 = f;
        answer1 = double.parse(f.toStringAsFixed(2));
        dubdiff = dubanswer1 - dubanswer2;
        diff = double.parse(dubdiff.toStringAsFixed(2)).abs();

        maunddubanswer1 = f / 9.53;
        maundanswer1 = double.parse((f / 9.53).toStringAsFixed(2));
        maunddubdiff = maundanswer1 - maundanswer2;
        maunnddiff = double.parse(maunddubdiff.toStringAsFixed(2)).abs();
      });
    }

    void updateValuesForQuintalCalculator1() {
      double storeInputKapas1 = double.tryParse(inputQuintalkapas1.text) ?? 0;
      double storeinputexpensePercetnage1 =
          double.tryParse(inputexpensePercetnage1.text) ?? 0;
      double storeInputExpense1 =
          double.tryParse(inputQuintalexpense1.text) ?? 0;
      double storeInputKapasia1 =
          double.tryParse(inputQuintalCotseed1.text) ?? 0;
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

      setState(() {
        quintaldubanswer1 = f;
        quintalanswer1 = double.parse(f.toStringAsFixed(2));
        quintaldubdiff = quintaldubanswer1 - quintaldubanswer2;
        quintaldiff = double.parse(quintaldubdiff.toStringAsFixed(2)).abs();

        quintalMaunddubanswer1 = f / 9.53;
        quintalMaundanswer1 = double.parse((f / 9.53).toStringAsFixed(2));
        quintalMaunddubdiff = quintalMaundanswer1 - quintalMaundanswer2;
        quintalMaunnddiff =
            double.parse(quintalMaunddubdiff.toStringAsFixed(2)).abs();
      });
    }

    void updateValuesForQuintalCalculator2() {
      double storeInputKapas2 = double.tryParse(inputQuintalkapas2.text) ?? 0;
      double storeinputexpensePercetnage2 =
          double.tryParse(inputexpensePercetnage2.text) ?? 0;
      double storeInputExpense2 =
          double.tryParse(inputQuintalexpense2.text) ?? 0;
      double storeInputKapasia2 =
          double.tryParse(inputQuintalCotseed2.text) ?? 0;
      double storeInputUtaro2 = double.tryParse(inpututaro2.text) ?? 0;
      double storeInputGhati2 = double.tryParse(inputghati2.text) ?? 0;
      double percentexpense =
          ((storeInputKapas2 / 5) * storeinputexpensePercetnage2) / 100;
      double sum1 =
          ((storeInputKapas2 / 5) + (storeInputExpense2 / 5) + percentexpense);

      double a = sum1 * 100;
      double b = 100 - storeInputUtaro2 - storeInputGhati2;
      double c = (storeInputKapasia2 / 5) * b;
      double d = a - c;
      double e = d / storeInputUtaro2;
      double f = e * 17.78;

      setState(() {
        quintaldubanswer2 = f;
        quintalanswer2 = double.parse(f.toStringAsFixed(2));
        quintaldubdiff = quintaldubanswer1 - quintaldubanswer2;
        quintaldiff = double.parse(quintaldubdiff.toStringAsFixed(2)).abs();

        quintalMaunddubanswer2 = f / 9.53;
        quintalMaundanswer2 = double.parse((f / 9.53).toStringAsFixed(2));
        quintalMaunddubdiff = quintalMaundanswer1 - quintalMaundanswer2;
        quintalMaunnddiff =
            double.parse(quintalMaunddubdiff.toStringAsFixed(2)).abs();
      });
    }

    void updateValueCalulator2() {
      double storeInputKapas2 = double.tryParse(inputkapas2.text) ?? 0;
      double storeInputExpense2 = double.tryParse(inputexpense2.text) ?? 0;
      double storeinputexpensePercetnage2 =
          double.tryParse(inputexpensePercetnage1.text) ?? 0;
      double storeInputKapasia2 = double.tryParse(inputkapasia2.text) ?? 0;
      double storeInputUtaro2 = double.tryParse(inpututaro2.text) ?? 0;
      double storeInputGhati2 = double.tryParse(inputghati2.text) ?? 0;
      double percentexpense =
          (storeInputKapas2 * storeinputexpensePercetnage2) / 100;
      double sum2 = (storeInputKapas2 + storeInputExpense2 + percentexpense);

      double a = sum2 * 100;
      double b = 100 - storeInputUtaro2 - storeInputGhati2;
      double c = storeInputKapasia2 * b;
      double d = a - c;
      double e = d / storeInputUtaro2;
      double f = e * 17.78;

      setState(() {
        dubanswer2 = f;
        answer2 = double.parse(f.toStringAsFixed(2));
        dubdiff = dubanswer1 - dubanswer2;
        diff = double.parse(dubdiff.toStringAsFixed(2)).abs();

        maunddubanswer2 = f / 9.53;
        maundanswer2 = double.parse((f / 9.53).toStringAsFixed(2));
        maunddubdiff = maundanswer1 - maundanswer2;
        maunnddiff = double.parse(maunddubdiff.toStringAsFixed(2)).abs();
      });
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        isQuintal!
            ? ListView(
                shrinkWrap: true,
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
                      title: 'Kapas Rate',
                      controller1: inputQuintalkapas1,
                      subtitle: '₹/Quintal',
                      height: 0,
                      width: 0,
                      controller2: inputQuintalkapas2,
                      onchaned1: (string) {
                        updateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        updateValuesForQuintalCalculator2();
                      }),

                  // Expense
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses',
                      controller1: inputQuintalexpense1,
                      subtitle: '₹/Quintal',
                      height: 0,
                      width: 0,
                      controller2: inputQuintalexpense2,
                      onchaned1: (string) {
                        updateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        updateValuesForQuintalCalculator2();
                      }),

                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses %',
                      controller1: inputexpensePercetnage1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: inputexpensePercetnage2,
                      onchaned1: (string) {
                        updateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        updateValuesForQuintalCalculator2();
                      }),

                  // Cotton Seed
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Cotton Seed',
                      controller1: inputQuintalCotseed1,
                      subtitle: '₹/Quintal',
                      height: 0,
                      width: 0,
                      controller2: inputQuintalCotseed2,
                      onchaned1: (string) {
                        updateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        updateValuesForQuintalCalculator2();
                      }),

                  //Out Turn / Utaro
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Out Turn',
                      controller1: inpututaro1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: inpututaro2,
                      onchaned1: (string) {
                        updateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        updateValuesForQuintalCalculator2();
                      }),

                  //Shortage / Ghati
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Shortage',
                      controller1: inputghati1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: inputghati2,
                      onchaned1: (string) {
                        updateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        updateValuesForQuintalCalculator2();
                      }),

                  // Final Answer
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: quintalanswer1,
                    result2: quintalanswer2,
                    subtext1: '₹/Candy',
                    subtext2: '₹/Candy',
                    title1: 'Cotton Coast',
                    title2: 'Padtar',
                  ),
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: quintalMaundanswer1,
                    result2: quintalMaundanswer2,
                    subtext1: '₹/Maund',
                    subtext2: '₹/Maund',
                    title1: 'Cotton Coast',
                    title2: 'Padtar',
                  ),

                  GlobalRowCompareWidget2Button(
                    onpressed1: () {
                      inputQuintalkapas1.clear();

                      inputQuintalexpense1.clear();

                      inputexpensePercetnage1.clear();

                      inputQuintalCotseed1.clear();

                      inpututaro1.clear();

                      inputghati1.clear();

                      setState(() {
                        quintalanswer1 = 0;

                        quintalMaundanswer1 = 0;

                        quintaldiff = 0;
                        quintalMaunnddiff = 0;
                      });

                      // result_output_difference.add(0);
                      // focusnodekapas1.requestFocus();
                    },
                    onpressed2: () {
                      // inputQuintalkapas1.clear();
                      inputQuintalkapas2.clear();

                      // inputQuintalexpense1.clear();
                      inputQuintalexpense2.clear();

                      // inputexpensePercetnage1.clear();
                      inputexpensePercetnage2.clear();

                      // inputQuintalCotseed1.clear();
                      inputQuintalCotseed2.clear();

                      // inpututaro1.clear();
                      inpututaro2.clear();

                      // inputghati1.clear();
                      inputghati2.clear();
                      setState(() {
                        // Quintalanswer1 = 0;
                        quintalanswer2 = 0;

                        // QuintalMaundanswer1 = 0;
                        quintalMaundanswer2 = 0;

                        quintaldiff = 0;
                        quintalMaunnddiff = 0;
                      });
                      // result_output_difference.add(0);
                      // focusnodekapas2.requestFocus();
                    },
                    text1: 'RESET 1',
                    text2: 'RESET 2',
                  ),
                  //
                  // // Khandi Diffrnce or Stram result
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Candy',
                    streamtitletext: 'Cotton Difference',
                    result: quintaldiff,
                  ),
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Maund Difference',
                    result: quintalMaunnddiff,
                  ),

                  SizedBox(height: 20.h),

                  // Rseet All Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      inputQuintalkapas1.clear();
                      inputQuintalkapas2.clear();

                      inputQuintalexpense1.clear();
                      inputQuintalexpense2.clear();

                      inputexpensePercetnage1.clear();
                      inputexpensePercetnage2.clear();

                      inputQuintalCotseed1.clear();
                      inputQuintalCotseed2.clear();

                      inpututaro1.clear();
                      inpututaro2.clear();

                      inputghati1.clear();
                      inputghati2.clear();
                      setState(() {
                        quintalanswer1 = 0;
                        quintalanswer2 = 0;

                        quintalMaundanswer1 = 0;
                        quintalMaundanswer2 = 0;

                        quintaldiff = 0;
                        quintalMaunnddiff = 0;
                      });
                    },
                    buttontext: 'Reset All',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),
                ],
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  //Heading of Calculator
                  const GlobalRowCompareWidget2TEXT(
                    title1: 'Calc1 ',
                    title2: 'Calc2 ',
                  ),

                  //Content Of Calculator
                  // Kappas

                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Kapas Rate',
                      controller1: inputkapas1,
                      subtitle: '₹/20kg',
                      height: 0,
                      width: 0,
                      controller2: inputkapas2,
                      onchaned1: (string) {
                        updateValueCalulator1();
                      },
                      onchane2: (string) {
                        updateValueCalulator2();
                      }),

                  // Expense
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses',
                      controller1: inputexpense1,
                      subtitle: '₹/20kg',
                      height: 0,
                      width: 0,
                      controller2: inputexpense2,
                      onchaned1: (string) {
                        updateValueCalulator1();
                      },
                      onchane2: (string) {
                        updateValueCalulator2();
                      }),

                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses %',
                      controller1: inputexpensePercetnage1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: inputexpensePercetnage2,
                      onchaned1: (string) {
                        updateValueCalulator1();
                      },
                      onchane2: (string) {
                        updateValueCalulator2();
                      }),

                  // Cotton Seed
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Cotton Seed',
                      controller1: inputkapasia1,
                      subtitle: '₹/20kg',
                      height: 0,
                      width: 0,
                      controller2: inputkapasia2,
                      onchaned1: (string) {
                        updateValueCalulator1();
                      },
                      onchane2: (string) {
                        updateValueCalulator2();
                      }),

                  //Out Turn / Utaro
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Out Turn',
                      controller1: inpututaro1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: inpututaro2,
                      onchaned1: (string) {
                        updateValueCalulator1();
                      },
                      onchane2: (string) {
                        updateValueCalulator2();
                      }),

                  //Shortage / Ghati
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Shortage',
                      controller1: inputghati1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: inputghati2,
                      onchaned1: (string) {
                        updateValueCalulator1();
                      },
                      onchane2: (string) {
                        updateValueCalulator2();
                      }),

                  // Final Answer
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: answer1,
                    result2: answer2,
                    subtext1: '₹/Candy',
                    subtext2: '₹/Candy',
                    title1: 'Cotton Coast',
                    title2: 'Padtar',
                  ),
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: maundanswer1,
                    result2: maundanswer2,
                    subtext1: '₹/Maund',
                    subtext2: '₹/Maund',
                    title1: 'Cotton Coast',
                    title2: 'Padtar',
                  ),

                  GlobalRowCompareWidget2Button(
                    onpressed1: () {
                      inputkapas1.clear();
                      // inputkapas2.clear();

                      inputexpense1.clear();
                      // inputexpense2.clear();

                      inputexpensePercetnage1.clear();
                      // inputexpensePercetnage2.clear();

                      inputkapasia1.clear();
                      // inputkapasia2.clear();

                      inpututaro1.clear();
                      // inpututaro2.clear();

                      inputghati1.clear();
                      // inputghati2.clear();
                      setState(() {
                        answer1 = 0;
                        // answer2 = 0;

                        maundanswer1 = 0;
                        // Maundanswer2 = 0;

                        diff = 0;
                        maunnddiff = 0;
                      });

                      // result_output_difference.add(0);
                      // focusnodekapas1.requestFocus();
                    },
                    onpressed2: () {
                      // inputkapas1.clear();
                      inputkapas2.clear();

                      // inputexpense1.clear();
                      inputexpense2.clear();

                      // inputexpensePercetnage1.clear();
                      inputexpensePercetnage2.clear();

                      // inputkapasia1.clear();
                      inputkapasia2.clear();

                      // inpututaro1.clear();
                      inpututaro2.clear();

                      // inputghati1.clear();
                      inputghati2.clear();
                      setState(() {
                        // answer1 = 0;
                        answer2 = 0;

                        // Maundanswer1 = 0;
                        maundanswer2 = 0;

                        diff = 0;
                        maunnddiff = 0;
                      });
                      // result_output_difference.add(0);
                      // focusnodekapas2.requestFocus();
                    },
                    text1: 'RESET 1',
                    text2: 'RESET 2',
                  ),
                  //
                  // // Khandi Diffrnce or Stram result
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Candy',
                    streamtitletext: 'Candy Difference',
                    result: diff,
                  ),
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Maund Difference',
                    result: maunnddiff,
                  ),

                  SizedBox(height: 20.h),

                  // Rseet All Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      inputkapas1.clear();
                      inputkapas2.clear();

                      inputexpense1.clear();
                      inputexpense2.clear();

                      inputexpensePercetnage1.clear();
                      inputexpensePercetnage2.clear();

                      inputkapasia1.clear();
                      inputkapasia2.clear();

                      inpututaro1.clear();
                      inpututaro2.clear();

                      inputghati1.clear();
                      inputghati2.clear();
                      setState(() {
                        answer1 = 0;
                        answer2 = 0;

                        maundanswer1 = 0;
                        maundanswer2 = 0;

                        diff = 0;
                        maunnddiff = 0;
                      });
                    },
                    buttontext: 'Reset All',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
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
            switchValue: isQuintal!,
            bigText: true),
      ],
    );
  }
}

class ForwardGinning extends StatefulWidget {
  const ForwardGinning({super.key});

  @override
  State<ForwardGinning> createState() => _ForwardGinningState();
}

class _ForwardGinningState extends State<ForwardGinning> {
  // for calculator 1
  final inputkapas1 = TextEditingController();
  final inputexpense1 = TextEditingController();
  final inputexpensePercetnage1 = TextEditingController();
  final inputkapasia1 = TextEditingController();
  final inpututaro1 = TextEditingController();
  final inputghati1 = TextEditingController();
  double answer1 = 0;
  double dubanswer1 = 0;
  double maundanswer1 = 0;
  double maunddubanswer1 = 0;

  // For Quintal
  final inputQuintalexpense1 = TextEditingController();
  final inputQuintalkapas1 = TextEditingController();
  final inputQuintalCotseed1 = TextEditingController();

  //for calculator 2
  final inputkapas2 = TextEditingController();
  final inputexpense2 = TextEditingController();
  final inputexpensePercetnage2 = TextEditingController();
  final inputkapasia2 = TextEditingController();
  final inpututaro2 = TextEditingController();
  final inputghati2 = TextEditingController();
  double answer2 = 0;
  double dubanswer2 = 0;
  double maundanswer2 = 0;
  double maunddubanswer2 = 0;

  // For Quintal
  final inputQuintalexpense2 = TextEditingController();
  final inputQuintalkapas2 = TextEditingController();
  final inputQuintalCotseed2 = TextEditingController();

  //Difference
  double diff = 0;
  double dubdiff = 0;
  double maunnddiff = 0;
  double maunddubdiff = 0;

  double quintaldubanswer1 = 0;
  double quintalanswer1 = 0;
  double quintaldubdiff = 0;
  double quintaldiff = 0;

  double quintalMaunddubanswer1 = 0;
  double quintalMaundanswer1 = 0;
  double quintalMaunddubdiff = 0;
  double quintalMaunnddiff = 0;
  double quintaldubanswer2 = 0, quintalanswer2 = 0;
  double quintalMaunddubanswer2 = 0, quintalMaundanswer2 = 0;
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

    void updateValueCalulator1() {
      double storeInputKapas1 = double.tryParse(inputkapas1.text) ?? 0;
      double storeInputExpense1 = double.tryParse(inputexpense1.text) ?? 0;
      double storeinputexpensePercetnage1 =
          double.tryParse(inputexpensePercetnage1.text) ?? 0;
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

      setState(() {
        dubanswer1 = f;
        answer1 = double.parse(f.toStringAsFixed(2));
        dubdiff = dubanswer1 - dubanswer2;
        diff = double.parse(dubdiff.toStringAsFixed(2)).abs();

        maunddubanswer1 = f / 9.53;
        maundanswer1 = double.parse((f / 9.53).toStringAsFixed(2));
        maunddubdiff = maundanswer1 - maundanswer2;
        maunnddiff = double.parse(maunddubdiff.toStringAsFixed(2)).abs();
      });
    }

    void updateValueCalulator2() {
      double storeInputKapas2 = double.tryParse(inputkapas2.text) ?? 0;
      double storeInputExpense2 = double.tryParse(inputexpense2.text) ?? 0;
      double storeinputexpensePercetnage2 =
          double.tryParse(inputexpensePercetnage1.text) ?? 0;
      double storeInputKapasia2 = double.tryParse(inputkapasia2.text) ?? 0;
      double storeInputUtaro2 = double.tryParse(inpututaro2.text) ?? 0;
      double storeInputGhati2 = double.tryParse(inputghati2.text) ?? 0;

      double percentexpense = isGujarat
          ? ((storeInputKapas2 * storeinputexpensePercetnage2) / 100)
          : isMaharashtra
              ? (((storeInputKapas2 / 5) * storeinputexpensePercetnage2) / 100)
              : (((storeInputKapas2 / 5) * storeinputexpensePercetnage2) / 100);
      double sum1 = 0;
      if (isGujarat)
        sum1 = (storeInputKapas2 + storeInputExpense2 + percentexpense);
      if (isMaharashtra || isNorthZone || isLowerRajsthan)
        sum1 = ((storeInputKapas2 / 5) +
            (storeInputExpense2 / 5) +
            percentexpense);
      if (isTelengana || isMadhyaPradesh || isAndhraPradesh || isKarnataka)
        sum1 = ((storeInputKapas2 / 5) + percentexpense);

      double a = sum1 * 100;

      double b = 100 - storeInputUtaro2 - storeInputGhati2;
      double c = isGujarat
          ? (storeInputKapasia2 * b)
          : isMaharashtra
              ? ((storeInputKapasia2 / 5) * b)
              : ((storeInputKapasia2 / 5) * b);
      double d = a - c;
      double e = d / storeInputUtaro2;
      double f = 0;
      if (isGujarat || isMaharashtra || isNorthZone || isLowerRajsthan)
        f = e * 17.78;
      if (isTelengana || isMadhyaPradesh || isAndhraPradesh || isKarnataka)
        f = (e * 17.78) + storeInputExpense2;

      setState(() {
        dubanswer2 = f;
        answer2 = double.parse(f.toStringAsFixed(2));
        dubdiff = dubanswer1 - dubanswer2;
        diff = double.parse(dubdiff.toStringAsFixed(2)).abs();

        maunddubanswer2 = f / 9.53;
        maundanswer2 = double.parse((f / 9.53).toStringAsFixed(2));
        maunddubdiff = maundanswer1 - maundanswer2;
        maunnddiff = double.parse(maunddubdiff.toStringAsFixed(2)).abs();
      });
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            //Heading of Calculator
            const GlobalRowCompareWidget2TEXT(
              title1: 'Calc1 ',
              title2: 'Calc2 ',
            ),

            //Content Of Calculator
            // Kappas

            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Kapas Rate',
                controller1: inputkapas1,
                subtitle: isGujarat ? '₹/20kg' : '₹/Quintal',
                height: 0,
                width: 0,
                controller2: inputkapas2,
                onchaned1: (string) {
                  updateValueCalulator1();
                },
                onchane2: (string) {
                  updateValueCalulator2();
                }),

            // Expense
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Expenses',
                controller1: inputexpense1,
                subtitle: isGujarat
                    ? '₹/20kg'
                    : isMaharashtra
                        ? '₹/Quintal'
                        : isNorthZone
                            ? '₹/Quintal'
                            : isLowerRajsthan
                                ? '₹/Quintal'
                                : '₹/Candy',
                height: 0,
                width: 0,
                controller2: inputexpense2,
                onchaned1: (string) {
                  updateValueCalulator1();
                },
                onchane2: (string) {
                  updateValueCalulator2();
                }),

            //Expensed in %
            if (isNorthZone || isLowerRajsthan)
              GlobalRowCompareWidget2textfielsWithOnchanges(
                  title: 'Expenses %',
                  controller1: inputexpensePercetnage1,
                  subtitle: '%',
                  height: 0,
                  width: 0,
                  controller2: inputexpensePercetnage2,
                  onchaned1: (string) {
                    updateValueCalulator1();
                  },
                  onchane2: (string) {
                    updateValueCalulator2();
                  }),

            // Cotton Seed
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Cotton Seed',
                controller1: inputkapasia1,
                subtitle: isGujarat ? '₹/20kg' : '₹/Quintal',
                height: 0,
                width: 0,
                controller2: inputkapasia2,
                onchaned1: (string) {
                  updateValueCalulator1();
                },
                onchane2: (string) {
                  updateValueCalulator2();
                }),

            //Out Turn / Utaro
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Out Turn',
                controller1: inpututaro1,
                subtitle: '%',
                height: 0,
                width: 0,
                controller2: inpututaro2,
                onchaned1: (string) {
                  updateValueCalulator1();
                },
                onchane2: (string) {
                  updateValueCalulator2();
                }),

            //Shortage / Ghati
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Shortage',
                controller1: inputghati1,
                subtitle: '%',
                height: 0,
                width: 0,
                controller2: inputghati2,
                onchaned1: (string) {
                  updateValueCalulator1();
                },
                onchane2: (string) {
                  updateValueCalulator2();
                }),

            // Final Answer
            if (!isNorthZone)
              GlobalRowCompareWidget2StreamBuilderWithAnswer(
                result1: answer1,
                result2: answer2,
                subtext1: '₹/Candy',
                subtext2: '₹/Candy',
                title1: 'Cotton Coast',
                title2: 'Padtar',
              ),
            if (isNorthZone)
              GlobalRowCompareWidget2StreamBuilderWithAnswer(
                result1: maundanswer1,
                result2: maundanswer2,
                subtext1: '₹/Maund',
                subtext2: '₹/Maund',
                title1: 'Cotton Coast',
                title2: 'Padtar',
              ),

            GlobalRowCompareWidget2Button(
              onpressed1: () {
                inputkapas1.clear();
                // inputkapas2.clear();

                inputexpense1.clear();
                // inputexpense2.clear();

                inputexpensePercetnage1.clear();
                // inputexpensePercetnage2.clear();

                inputkapasia1.clear();
                // inputkapasia2.clear();

                inpututaro1.clear();
                // inpututaro2.clear();

                inputghati1.clear();
                // inputghati2.clear();
                setState(() {
                  answer1 = 0;
                  // answer2 = 0;

                  maundanswer1 = 0;
                  // Maundanswer2 = 0;

                  diff = 0;
                  maunnddiff = 0;
                });

                // result_output_difference.add(0);
                // focusnodekapas1.requestFocus();
              },
              onpressed2: () {
                // inputkapas1.clear();
                inputkapas2.clear();

                // inputexpense1.clear();
                inputexpense2.clear();

                // inputexpensePercetnage1.clear();
                inputexpensePercetnage2.clear();

                // inputkapasia1.clear();
                inputkapasia2.clear();

                // inpututaro1.clear();
                inpututaro2.clear();

                // inputghati1.clear();
                inputghati2.clear();
                setState(() {
                  // answer1 = 0;
                  answer2 = 0;

                  // Maundanswer1 = 0;
                  maundanswer2 = 0;

                  diff = 0;
                  maunnddiff = 0;
                });
                // result_output_difference.add(0);
                // focusnodekapas2.requestFocus();
              },
              text1: 'RESET 1',
              text2: 'RESET 2',
            ),
            //
            // // Khandi Diffrnce or Stram result
            SizedBox(height: 20.h),

            if (!isNorthZone)
              GlobalResultBuilderForResults(
                substreamtext: '₹/Candy',
                streamtitletext: 'Candy Difference',
                result: diff,
              ),
            SizedBox(height: 20.h),
            if (isNorthZone)
              GlobalResultBuilderForResults(
                substreamtext: '₹/Maund',
                streamtitletext: 'Maund Difference',
                result: maunnddiff,
              ),

            SizedBox(height: 20.h),

            // Rseet All Button
            GlobalButtonSimpleText(
              onPressed: () {
                inputkapas1.clear();
                inputkapas2.clear();

                inputexpense1.clear();
                inputexpense2.clear();

                inputexpensePercetnage1.clear();
                inputexpensePercetnage2.clear();

                inputkapasia1.clear();
                inputkapasia2.clear();

                inpututaro1.clear();
                inpututaro2.clear();

                inputghati1.clear();
                inputghati2.clear();
                setState(() {
                  answer1 = 0;
                  answer2 = 0;

                  maundanswer1 = 0;
                  maundanswer2 = 0;

                  diff = 0;
                  maunnddiff = 0;
                });
              },
              buttontext: 'Reset All',
              height: globalSingalResetButtonHeight,
              width: globalSingalResetButtonWidth,
            ),
          ],
        ),
      ],
    );
  }
}

class AllinOneReverseGinning extends StatefulWidget {
  const AllinOneReverseGinning({super.key});

  @override
  State<AllinOneReverseGinning> createState() => _AllinOneReverseGinningState();
}

class _AllinOneReverseGinningState extends State<AllinOneReverseGinning> {
  // for calculator 1
  final reverseinputkapas1 = TextEditingController();
  final reverseinputexpense1 = TextEditingController();
  final reverseinputexpensePercetnage1 = TextEditingController();
  final reverseinputkapasia1 = TextEditingController();
  final reverseinpututaro1 = TextEditingController();
  final reverseinputghati1 = TextEditingController();
  //Quintal
  final reverseinputQuintalexpense1 = TextEditingController();
  final reverseinputQuintalCotseed1 = TextEditingController();

  //for calculator 2
  final reverseinputkapas2 = TextEditingController();
  final reverseinputexpense2 = TextEditingController();
  final reverseinputexpensePercetnage2 = TextEditingController();
  final reverseinputkapasia2 = TextEditingController();
  final reverseinpututaro2 = TextEditingController();
  final reverseinputghati2 = TextEditingController();
  //Quintal
  final reverseinputQuintalexpense2 = TextEditingController();
  final reverseinputQuintalCotseed2 = TextEditingController();

  double reverseanswerMaund = 0;
  double reversedubanswerMaund = 0;
  double reverseanswerMaund2 = 0;
  double reversedubanswerMaund2 = 0;

  double reverseanswer1 = 0;
  double reversedubanswer1 = 0;
  double reverseanswer2 = 0;
  double reversedubanswer2 = 0;

  //diffrence
  double reversediff = 0;
  double reversedubdiff = 0;
  double reversediffMaund = 0;
  double reversedubdiffMaund = 0;

  double quintalReversedubanswer1 = 0;
  double quintalReverseanswer1 = 0;
  double quintalReversedubanswerMaund = 0;
  double quintalReverseanswerMaund = 0;
  double quintalReversedubdiff = 0;

  double quintalReversedubanswer2 = 0;
  double quintalReversediff = 0;

  double quintalReversedubdiffMaund = 0;

  double quintalReversedubanswerMaund2 = 0;
  double quintalReversediffMaund = 0;

  double quintalReverseanswer2 = 0;
  double quintalReverseanswerMaund2 = 0;

  void _reverseUpdateValuesForCalculator1() {
    double storeInputKapas1 = double.tryParse(reverseinputkapas1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(reverseinputexpense1.text) ?? 0;
    double storeInputPercentageExpense1 =
        double.tryParse(reverseinputexpensePercetnage1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(reverseinputkapasia1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(reverseinpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(reverseinputghati1.text) ?? 0;

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
      reversedubanswer1 = f;
      reverseanswer1 = double.parse(f.toStringAsFixed(2));

      reversedubanswerMaund = maund;
      reverseanswerMaund = double.parse(maund.toStringAsFixed(2));

      //kappas diff
      reversedubdiff = reversedubanswer1 - reversedubanswer2;
      reversediff = double.parse(reversedubdiff.toStringAsFixed(2)).abs();

      //maund diff
      reversedubdiffMaund = reversedubanswerMaund - reversedubanswerMaund2;
      reversediffMaund = double.parse(reversedubdiffMaund.toStringAsFixed(2));
    });
  }

  void _reverseUpdateValuesForCalculator2() {
    double storeInputKapas2 = double.tryParse(reverseinputkapas2.text) ?? 0;
    double storeInputExpense2 = double.tryParse(reverseinputexpense2.text) ?? 0;
    double storeInputPercentageExpense2 =
        double.tryParse(reverseinputexpensePercetnage2.text) ?? 0;
    double storeInputKapasia2 = double.tryParse(reverseinputkapasia2.text) ?? 0;
    double storeInputUtaro2 = double.tryParse(reverseinpututaro2.text) ?? 0;
    double storeInputGhati2 = double.tryParse(reverseinputghati2.text) ?? 0;

    double a1 = (storeInputKapas2 * 0.2812 / 5);
    double a2 = a1 * storeInputUtaro2;
    double a3 = 100 - storeInputUtaro2 - storeInputGhati2;
    double a4 = a3 * storeInputKapasia2;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double percentexpense = (a6 * storeInputPercentageExpense2) / 100;
    double f = a6 - storeInputExpense2 - percentexpense;

    double maund = storeInputKapas2 / 9.53;

    setState(() {
      reverseanswerMaund2 = double.parse(maund.toStringAsFixed(2));
      reverseanswer2 = double.parse(f.toStringAsFixed(2));
      reversedubanswer2 = f;
      reversedubdiff = reversedubanswer1 - reversedubanswer2;
      reversediff = double.parse(reversedubdiff.toStringAsFixed(2)).abs();
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
      quintalReversedubanswer1 = f;
      quintalReverseanswer1 = double.parse(f.toStringAsFixed(2));

      quintalReversedubanswerMaund = maund;
      quintalReverseanswerMaund = double.parse(maund.toStringAsFixed(2));

      //kappas diff
      quintalReversedubdiff =
          quintalReversedubanswer1 - quintalReversedubanswer2;
      quintalReversediff =
          double.parse(quintalReversedubdiff.toStringAsFixed(2)).abs();

      //maund diff
      quintalReversedubdiffMaund =
          quintalReversedubanswerMaund - quintalReversedubanswerMaund2;
      quintalReversediffMaund =
          double.parse(quintalReversedubdiffMaund.toStringAsFixed(2));
    });
  }

  void _reverseUpdateValuesForQuintalCalculator2() {
    double storeInputKapas2 = double.tryParse(reverseinputkapas2.text) ?? 0;
    double storeInputExpense2 =
        double.tryParse(reverseinputQuintalexpense2.text) ?? 0;
    double storeInputPercentageExpense2 =
        double.tryParse(reverseinputexpensePercetnage2.text) ?? 0;
    double storeInputKapasia2 =
        double.tryParse(reverseinputQuintalCotseed2.text) ?? 0;
    double storeInputUtaro2 = double.tryParse(reverseinpututaro2.text) ?? 0;
    double storeInputGhati2 = double.tryParse(reverseinputghati2.text) ?? 0;

    double a1 = (storeInputKapas2 * 0.2812);

    double a2 = a1 * storeInputUtaro2;
    double a3 = 100 - storeInputUtaro2 - storeInputGhati2;
    double a4 = a3 * storeInputKapasia2;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double percentexpense = (a6 * storeInputPercentageExpense2) / 100;
    double f = a6 - storeInputExpense2 - percentexpense;

    //For Maund
    double maund = storeInputKapas2 / 9.53;

    setState(() {
      quintalReversedubanswer2 = f;
      quintalReverseanswer2 = double.parse(f.toStringAsFixed(2));

      quintalReversedubanswerMaund2 = maund;
      quintalReverseanswerMaund2 = double.parse(maund.toStringAsFixed(2));

      //kappas diff
      quintalReversedubdiff =
          quintalReversedubanswer1 - quintalReversedubanswer2;
      quintalReversediff =
          double.parse(quintalReversedubdiff.toStringAsFixed(2)).abs();

      //maund diff
      quintalReversedubdiffMaund =
          quintalReversedubanswerMaund - quintalReversedubanswerMaund2;
      quintalReversediffMaund =
          double.parse(quintalReversedubdiffMaund.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        reverseisQuintal!
            ? ListView(
                shrinkWrap: true,
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
                      controller1: reverseinputkapas1,
                      subtitle: '₹/Candy',
                      height: 0,
                      width: 0,
                      controller2: reverseinputkapas2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForQuintalCalculator2();
                      }),

                  // Expense
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses',
                      controller1: reverseinputQuintalexpense1,
                      subtitle: '₹/Quintal',
                      height: 0,
                      width: 0,
                      controller2: reverseinputQuintalexpense2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForQuintalCalculator2();
                      }),

                  // Expense
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses %',
                      controller1: reverseinputexpensePercetnage1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: reverseinputexpensePercetnage2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  // Cotton Seed
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Cotton Seed',
                      controller1: reverseinputQuintalCotseed1,
                      subtitle: '₹/Quintal',
                      height: 0,
                      width: 0,
                      controller2: reverseinputQuintalCotseed2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForQuintalCalculator2();
                      }),

                  //Out Turn / Utaro
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Out Turn',
                      controller1: reverseinpututaro1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: reverseinpututaro2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForQuintalCalculator2();
                      }),

                  //Shortage / Ghati
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Shortage',
                      controller1: reverseinputghati1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: reverseinputghati2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForQuintalCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForQuintalCalculator2();
                      }),

                  // Final Answer
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: quintalReverseanswer1,
                    result2: quintalReverseanswer2,
                    subtext1: '₹/Quintal',
                    subtext2: '₹/Quintal',
                    title1: 'Kapas Coast',
                    title2: 'Padtar',
                  ),

                  //Maund Difference
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: quintalReverseanswerMaund,
                    result2: quintalReverseanswerMaund2,
                    subtext1: '₹/Maund',
                    subtext2: '₹/Maund',
                    title1: 'Candy Maund',
                    title2: 'Padtar',
                  ),

                  GlobalRowCompareWidget2Button(
                    onpressed1: () {
                      reverseinputkapas1.clear();
                      // reverseinputkapas2.clear();

                      reverseinputQuintalexpense1.clear();
                      // reverseinputQuintalexpense2.clear();

                      reverseinputexpensePercetnage1.clear();
                      // reverseinputexpensePercetnage2.clear();

                      reverseinputQuintalCotseed1.clear();
                      // reverseinputQuintalCotseed2.clear();

                      reverseinpututaro1.clear();
                      // reverseinpututaro2.clear();

                      reverseinputghati1.clear();
                      // reverseinputghati2.clear();

                      setState(() {
                        quintalReverseanswer1 = 0;
                        // QuintalReverseanswer2 = 0;

                        quintalReverseanswerMaund = 0;
                        // QuintalReverseanswerMaund2 = 0;

                        quintalReversediff = 0;
                        quintalReversediffMaund = 0;
                      });
                    },
                    onpressed2: () {
                      // reverseinputkapas1.clear();
                      reverseinputkapas2.clear();

                      // reverseinputQuintalexpense1.clear();
                      reverseinputQuintalexpense2.clear();

                      // reverseinputexpensePercetnage1.clear();
                      reverseinputexpensePercetnage2.clear();

                      // reverseinputQuintalCotseed1.clear();
                      reverseinputQuintalCotseed2.clear();

                      // reverseinpututaro1.clear();
                      reverseinpututaro2.clear();

                      // reverseinputghati1.clear();
                      reverseinputghati2.clear();

                      setState(() {
                        // QuintalReverseanswer1 = 0;
                        quintalReverseanswer2 = 0;

                        // QuintalReverseanswerMaund = 0;
                        quintalReverseanswerMaund2 = 0;

                        quintalReversediff = 0;
                        quintalReversediffMaund = 0;
                      });
                    },
                    text1: 'RESET 1',
                    text2: 'RESET 2',
                  ),

                  // Khandi Diffrnce or Stram result
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/20Kg',
                    streamtitletext: 'Kapas Difference',
                    result: quintalReversediff,
                  ),

                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Kapas Difference',
                    result: quintalReversediffMaund,
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  // Reset All Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      reverseinputkapas1.clear();
                      reverseinputkapas2.clear();

                      reverseinputQuintalexpense1.clear();
                      reverseinputQuintalexpense2.clear();

                      reverseinputexpensePercetnage1.clear();
                      reverseinputexpensePercetnage2.clear();

                      reverseinputQuintalCotseed1.clear();
                      reverseinputQuintalCotseed2.clear();

                      reverseinpututaro1.clear();
                      reverseinpututaro2.clear();

                      reverseinputghati1.clear();
                      reverseinputghati2.clear();

                      setState(() {
                        quintalReverseanswer1 = 0;
                        quintalReverseanswer2 = 0;

                        quintalReverseanswerMaund = 0;
                        quintalReverseanswerMaund2 = 0;

                        quintalReversediff = 0;
                        quintalReversediffMaund = 0;
                      });
                    },
                    buttontext: 'Reset All',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),
                ],
              )
            : ListView(
                shrinkWrap: true,
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
                      controller1: reverseinputkapas1,
                      subtitle: '₹/Candy',
                      height: 0,
                      width: 0,
                      controller2: reverseinputkapas2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  // Expense
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses',
                      controller1: reverseinputexpense1,
                      subtitle: '₹/20Kg',
                      height: 0,
                      width: 0,
                      controller2: reverseinputexpense2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  // Expense
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Expenses %',
                      controller1: reverseinputexpensePercetnage1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: reverseinputexpensePercetnage2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  // Cotton Seed
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Cotton Seed',
                      controller1: reverseinputkapasia1,
                      subtitle: '₹/20Kg',
                      height: 0,
                      width: 0,
                      controller2: reverseinputkapasia2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  //Out Turn / Utaro
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Out Turn',
                      controller1: reverseinpututaro1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: reverseinpututaro2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  //Shortage / Ghati
                  GlobalRowCompareWidget2textfielsWithOnchanges(
                      title: 'Shortage',
                      controller1: reverseinputghati1,
                      subtitle: '%',
                      height: 0,
                      width: 0,
                      controller2: reverseinputghati2,
                      onchaned1: (string) {
                        _reverseUpdateValuesForCalculator1();
                      },
                      onchane2: (string) {
                        _reverseUpdateValuesForCalculator2();
                      }),

                  // Final Answer
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: reverseanswer1,
                    result2: reverseanswer2,
                    subtext1: '₹/20Kg',
                    subtext2: '₹/20Kg',
                    title1: 'Kapas Coast',
                    title2: 'Padtar',
                  ),

                  //Maund Difference
                  GlobalRowCompareWidget2StreamBuilderWithAnswer(
                    result1: reverseanswerMaund,
                    result2: reverseanswerMaund2,
                    subtext1: '₹/Maund',
                    subtext2: '₹/Maund',
                    title1: 'Candy Maund',
                    title2: 'Padtar',
                  ),

                  GlobalRowCompareWidget2Button(
                    onpressed1: () {
                      reverseinputkapas1.clear();
                      // reverseinputkapas2.clear();

                      reverseinputexpense1.clear();
                      // reverseinputexpense2.clear();

                      reverseinputexpensePercetnage1.clear();
                      // reverseinputexpensePercetnage2.clear();

                      reverseinputkapasia1.clear();
                      // reverseinputkapasia2.clear();

                      reverseinpututaro1.clear();
                      // reverseinpututaro2.clear();

                      reverseinputghati1.clear();
                      // reverseinputghati2.clear();

                      setState(() {
                        reverseanswer1 = 0;
                        // reverseanswer2 = 0;

                        reverseanswerMaund = 0;
                        // reverseanswerMaund2 = 0;
                        reversediff = 0;
                        reversediffMaund = 0;
                      });
                    },
                    onpressed2: () {
                      // reverseinputkapas1.clear();
                      reverseinputkapas2.clear();

                      // reverseinputexpense1.clear();
                      reverseinputexpense2.clear();

                      // reverseinputexpensePercetnage1.clear();
                      reverseinputexpensePercetnage2.clear();

                      // reverseinputkapasia1.clear();
                      reverseinputkapasia2.clear();

                      // reverseinpututaro1.clear();
                      reverseinpututaro2.clear();

                      // reverseinputghati1.clear();
                      reverseinputghati2.clear();

                      setState(() {
                        // reverseanswer1 = 0;
                        reverseanswer2 = 0;

                        // reverseanswerMaund = 0;
                        reverseanswerMaund2 = 0;
                        reversediff = 0;
                        reversediffMaund = 0;
                      });
                    },
                    text1: 'RESET 1',
                    text2: 'RESET 2',
                  ),

                  // Khandi Diffrnce or Stram result
                  SizedBox(height: 20.h),
                  GlobalResultBuilderForResults(
                    substreamtext: '₹/20Kg',
                    streamtitletext: 'Kapas Difference',
                    result: reversediff,
                  ),

                  GlobalResultBuilderForResults(
                    substreamtext: '₹/Maund',
                    streamtitletext: 'Kapas Difference',
                    result: reversediffMaund,
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  // Reset All Button
                  GlobalButtonSimpleText(
                    onPressed: () {
                      reverseinputkapas1.clear();
                      reverseinputkapas2.clear();

                      reverseinputexpense1.clear();
                      reverseinputexpense2.clear();

                      reverseinputexpensePercetnage1.clear();
                      reverseinputexpensePercetnage2.clear();

                      reverseinputkapasia1.clear();
                      reverseinputkapasia2.clear();

                      reverseinpututaro1.clear();
                      reverseinpututaro2.clear();

                      reverseinputghati1.clear();
                      reverseinputghati2.clear();

                      setState(() {
                        reverseanswer1 = 0;
                        reverseanswer2 = 0;

                        reverseanswerMaund = 0;
                        reverseanswerMaund2 = 0;
                        reversediff = 0;
                        reversediffMaund = 0;
                      });
                    },
                    buttontext: 'Reset All',
                    height: globalSingalResetButtonHeight,
                    width: globalSingalResetButtonWidth,
                  ),
                ],
              ),
        SwitchWithTwoText(
            frontText: '₹/20kg',
            backText: '₹/Quintal',
            onChange: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                reverseisQuintal = value;
              });
            },
            switchValue: reverseisQuintal!,
            bigText: true),
      ],
    );
  }
}

class ReverseGinning extends StatefulWidget {
  const ReverseGinning({super.key});

  @override
  State<ReverseGinning> createState() => _ReverseGinningState();
}

class _ReverseGinningState extends State<ReverseGinning> {
  // for calculator 1
  final reverseinputkapas1 = TextEditingController();
  final reverseinputexpense1 = TextEditingController();
  final reverseinputexpensePercetnage1 = TextEditingController();
  final reverseinputkapasia1 = TextEditingController();
  final reverseinpututaro1 = TextEditingController();
  final reverseinputghati1 = TextEditingController();
  //Quintal
  final reverseinputQuintalexpense1 = TextEditingController();
  final reverseinputQuintalCotseed1 = TextEditingController();

  //for calculator 2
  final reverseinputkapas2 = TextEditingController();
  final reverseinputexpense2 = TextEditingController();
  final reverseinputexpensePercetnage2 = TextEditingController();
  final reverseinputkapasia2 = TextEditingController();
  final reverseinpututaro2 = TextEditingController();
  final reverseinputghati2 = TextEditingController();
  //Quintal
  final reverseinputQuintalexpense2 = TextEditingController();
  final reverseinputQuintalCotseed2 = TextEditingController();

  double reverseanswerMaund = 0;
  double reversedubanswerMaund = 0;
  double reverseanswerMaund2 = 0;
  double reversedubanswerMaund2 = 0;

  double reverseanswer1 = 0;
  double reversedubanswer1 = 0;
  double reverseanswer2 = 0;
  double reversedubanswer2 = 0;

  //diffrence
  double reversediff = 0;
  double reversedubdiff = 0;
  double reversediffMaund = 0;
  double reversedubdiffMaund = 0;

  double quintalReversedubanswer1 = 0;
  double quintalReverseanswer1 = 0;
  double quintalReversedubanswerMaund = 0;
  double quintalReverseanswerMaund = 0;
  double quintalReversedubdiff = 0;

  double quintalReversedubanswer2 = 0;
  double quintalReversediff = 0;

  double quintalReversedubdiffMaund = 0;

  double quintalReversedubanswerMaund2 = 0;
  double quintalReversediffMaund = 0;

  double quintalReverseanswer2 = 0;
  double quintalReverseanswerMaund2 = 0;

  void _reverseUpdateValuesForCalculator1() {
    double storeInputKapas1 = double.tryParse(reverseinputkapas1.text) ?? 0;
    double storeInputExpense1 = double.tryParse(reverseinputexpense1.text) ?? 0;
    double storeInputPercentageExpense1 =
        double.tryParse(reverseinputexpensePercetnage1.text) ?? 0;
    double storeInputKapasia1 = double.tryParse(reverseinputkapasia1.text) ?? 0;
    double storeInputUtaro1 = double.tryParse(reverseinpututaro1.text) ?? 0;
    double storeInputGhati1 = double.tryParse(reverseinputghati1.text) ?? 0;

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
      reversedubanswer1 = f;
      reverseanswer1 = double.parse(f.toStringAsFixed(2));

      reversedubanswerMaund = maund;
      reverseanswerMaund = double.parse(maund.toStringAsFixed(2));

      //kappas diff
      reversedubdiff = reversedubanswer1 - reversedubanswer2;
      reversediff = double.parse(reversedubdiff.toStringAsFixed(2)).abs();

      //maund diff
      reversedubdiffMaund = reversedubanswerMaund - reversedubanswerMaund2;
      reversediffMaund = double.parse(reversedubdiffMaund.toStringAsFixed(2));
    });
  }

  void _reverseUpdateValuesForCalculator2() {
    double storeInputKapas2 = double.tryParse(reverseinputkapas2.text) ?? 0;
    double storeInputExpense2 = double.tryParse(reverseinputexpense2.text) ?? 0;
    double storeInputPercentageExpense2 =
        double.tryParse(reverseinputexpensePercetnage2.text) ?? 0;
    double storeInputKapasia2 = double.tryParse(reverseinputkapasia2.text) ?? 0;
    double storeInputUtaro2 = double.tryParse(reverseinpututaro2.text) ?? 0;
    double storeInputGhati2 = double.tryParse(reverseinputghati2.text) ?? 0;

    double a1 = (storeInputKapas2 * 0.2812 / 5);
    double a2 = a1 * storeInputUtaro2;
    double a3 = 100 - storeInputUtaro2 - storeInputGhati2;
    double a4 = a3 * storeInputKapasia2;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double percentexpense = (a6 * storeInputPercentageExpense2) / 100;
    double f = a6 - storeInputExpense2 - percentexpense;

    double maund = storeInputKapas2 / 9.53;

    setState(() {
      reverseanswerMaund2 = double.parse(maund.toStringAsFixed(2));
      reverseanswer2 = double.parse(f.toStringAsFixed(2));
      reversedubanswer2 = f;
      reversedubdiff = reversedubanswer1 - reversedubanswer2;
      reversediff = double.parse(reversedubdiff.toStringAsFixed(2)).abs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ListView(
          shrinkWrap: true,
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
                controller1: reverseinputkapas1,
                subtitle: '₹/Candy',
                height: 0,
                width: 0,
                controller2: reverseinputkapas2,
                onchaned1: (string) {
                  _reverseUpdateValuesForCalculator1();
                },
                onchane2: (string) {
                  _reverseUpdateValuesForCalculator2();
                }),

            // Expense
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Expenses',
                controller1: reverseinputexpense1,
                subtitle: '₹/20Kg',
                height: 0,
                width: 0,
                controller2: reverseinputexpense2,
                onchaned1: (string) {
                  _reverseUpdateValuesForCalculator1();
                },
                onchane2: (string) {
                  _reverseUpdateValuesForCalculator2();
                }),

            // Expense
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Expenses %',
                controller1: reverseinputexpensePercetnage1,
                subtitle: '%',
                height: 0,
                width: 0,
                controller2: reverseinputexpensePercetnage2,
                onchaned1: (string) {
                  _reverseUpdateValuesForCalculator1();
                },
                onchane2: (string) {
                  _reverseUpdateValuesForCalculator2();
                }),

            // Cotton Seed
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Cotton Seed',
                controller1: reverseinputkapasia1,
                subtitle: '₹/20Kg',
                height: 0,
                width: 0,
                controller2: reverseinputkapasia2,
                onchaned1: (string) {
                  _reverseUpdateValuesForCalculator1();
                },
                onchane2: (string) {
                  _reverseUpdateValuesForCalculator2();
                }),

            //Out Turn / Utaro
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Out Turn',
                controller1: reverseinpututaro1,
                subtitle: '%',
                height: 0,
                width: 0,
                controller2: reverseinpututaro2,
                onchaned1: (string) {
                  _reverseUpdateValuesForCalculator1();
                },
                onchane2: (string) {
                  _reverseUpdateValuesForCalculator2();
                }),

            //Shortage / Ghati
            GlobalRowCompareWidget2textfielsWithOnchanges(
                title: 'Shortage',
                controller1: reverseinputghati1,
                subtitle: '%',
                height: 0,
                width: 0,
                controller2: reverseinputghati2,
                onchaned1: (string) {
                  _reverseUpdateValuesForCalculator1();
                },
                onchane2: (string) {
                  _reverseUpdateValuesForCalculator2();
                }),

            // Final Answer
            GlobalRowCompareWidget2StreamBuilderWithAnswer(
              result1: reverseanswer1,
              result2: reverseanswer2,
              subtext1: '₹/20Kg',
              subtext2: '₹/20Kg',
              title1: 'Kapas Coast',
              title2: 'Padtar',
            ),

            //Maund Difference
            GlobalRowCompareWidget2StreamBuilderWithAnswer(
              result1: reverseanswerMaund,
              result2: reverseanswerMaund2,
              subtext1: '₹/Maund',
              subtext2: '₹/Maund',
              title1: 'Candy Maund',
              title2: 'Padtar',
            ),

            GlobalRowCompareWidget2Button(
              onpressed1: () {
                reverseinputkapas1.clear();
                // reverseinputkapas2.clear();

                reverseinputexpense1.clear();
                // reverseinputexpense2.clear();

                reverseinputexpensePercetnage1.clear();
                // reverseinputexpensePercetnage2.clear();

                reverseinputkapasia1.clear();
                // reverseinputkapasia2.clear();

                reverseinpututaro1.clear();
                // reverseinpututaro2.clear();

                reverseinputghati1.clear();
                // reverseinputghati2.clear();

                setState(() {
                  reverseanswer1 = 0;
                  // reverseanswer2 = 0;

                  reverseanswerMaund = 0;
                  // reverseanswerMaund2 = 0;
                  reversediff = 0;
                  reversediffMaund = 0;
                });
              },
              onpressed2: () {
                // reverseinputkapas1.clear();
                reverseinputkapas2.clear();

                // reverseinputexpense1.clear();
                reverseinputexpense2.clear();

                // reverseinputexpensePercetnage1.clear();
                reverseinputexpensePercetnage2.clear();

                // reverseinputkapasia1.clear();
                reverseinputkapasia2.clear();

                // reverseinpututaro1.clear();
                reverseinpututaro2.clear();

                // reverseinputghati1.clear();
                reverseinputghati2.clear();

                setState(() {
                  // reverseanswer1 = 0;
                  reverseanswer2 = 0;

                  // reverseanswerMaund = 0;
                  reverseanswerMaund2 = 0;
                  reversediff = 0;
                  reversediffMaund = 0;
                });
              },
              text1: 'RESET 1',
              text2: 'RESET 2',
            ),

            // Khandi Diffrnce or Stram result
            SizedBox(height: 20.h),
            GlobalResultBuilderForResults(
              substreamtext: '₹/20Kg',
              streamtitletext: 'Kapas Difference',
              result: reversediff,
            ),

            GlobalResultBuilderForResults(
              substreamtext: '₹/Maund',
              streamtitletext: 'Kapas Difference',
              result: reversediffMaund,
            ),

            SizedBox(
              height: 20.h,
            ),

            // Reset All Button
            GlobalButtonSimpleText(
              onPressed: () {
                reverseinputkapas1.clear();
                reverseinputkapas2.clear();

                reverseinputexpense1.clear();
                reverseinputexpense2.clear();

                reverseinputexpensePercetnage1.clear();
                reverseinputexpensePercetnage2.clear();

                reverseinputkapasia1.clear();
                reverseinputkapasia2.clear();

                reverseinpututaro1.clear();
                reverseinpututaro2.clear();

                reverseinputghati1.clear();
                reverseinputghati2.clear();

                setState(() {
                  reverseanswer1 = 0;
                  reverseanswer2 = 0;

                  reverseanswerMaund = 0;
                  reverseanswerMaund2 = 0;
                  reversediff = 0;
                  reversediffMaund = 0;
                });
              },
              buttontext: 'Reset All',
              height: globalSingalResetButtonHeight,
              width: globalSingalResetButtonWidth,
            ),
          ],
        ),
        SwitchWithTwoText(
            frontText: '₹/20kg',
            backText: '₹/Quintal',
            onChange: (bool value) {
              // This is called when the user toggles the switch.
              setState(() {
                reverseisQuintal = value;
              });
            },
            switchValue: reverseisQuintal!,
            bigText: true),
      ],
    );
  }
}
