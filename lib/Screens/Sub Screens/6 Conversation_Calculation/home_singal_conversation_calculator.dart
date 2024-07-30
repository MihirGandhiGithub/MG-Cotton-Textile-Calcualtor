import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_with_text.dart';
import '../../../Constants/Global_Widgets/Result_Text/bigresult_text.dart';
import '../../../Constants/Global_Widgets/Row/three_content.dart';
import '../../../Constants/Global_Widgets/Switch/switch_with_two_text.dart';
import '../../../StageManagementClass/provider_state_management.dart';
import 'package:provider/provider.dart';

class HomeSingalConversationCalulator extends StatefulWidget {
  const HomeSingalConversationCalulator({Key? key}) : super(key: key);

  @override
  State<HomeSingalConversationCalulator> createState() =>
      _HomeSingalConversationCalulator();
}

class _HomeSingalConversationCalulator
    extends State<HomeSingalConversationCalulator>
    with SingleTickerProviderStateMixin {
  //cents to indian
  bool centstoindian = true;
  bool reversecentstoindian = false;
  final cottonRate = TextEditingController();
  final expense = TextEditingController();
  final exchangeRate = TextEditingController();
  final exportRateCents = TextEditingController();
  final exportRateUSD = TextEditingController();
  double answerCentsToIndin = 0;
  double answerCentsToIndinReverse = 0;

  double answerCNYToIndian = 0;
  double answerIndinaToCNY = 0;

  final usCents = TextEditingController();
  final exchnageRate = TextEditingController();

  final usCentsReverse = TextEditingController();
  void _centsToIndain() {
    double storeUsCents = double.tryParse(usCents.text) ?? 0;
    double storeExchangeRate = double.tryParse(exchnageRate.text) ?? 0;
    double storeUsCentsReverse = double.tryParse(usCentsReverse.text) ?? 0;
    if (reversecentstoindian) {
      double a = storeUsCentsReverse / 355.60;
      double b = a / storeExchangeRate;
      double c = b * 0.45359;
      double d = c * 100;
      setState(() {
        answerCentsToIndinReverse = double.parse(d.toStringAsFixed(2));
      });
    } else {
      double a = storeUsCents / 100;
      double b = a / 0.45359;
      double c = b * storeExchangeRate;
      double d = c * 355.60;
      setState(() {
        answerCentsToIndin = double.parse(d.toStringAsFixed(2));
      });
    }
  }

  double answerMaund = 0;
  double answer170Kg = 0;
  double reverseanswerCandy = 0;
  double reverseanswer170Kg = 0;

  final punjabToIndian = TextEditingController();
  final indinaToPunjab = TextEditingController();
  void _punjabRateToIndina() {
    double storeINRMaund = double.tryParse(punjabToIndian.text) ?? 0;
    double storeINRCandy = double.tryParse(indinaToPunjab.text) ?? 0;
    if (reversepanjabtocandy) {
      double a = storeINRCandy / 9.53;
      double b = (storeINRCandy / 355.60) * 170;

      setState(() {
        answerMaund = double.parse(a.toStringAsFixed(2));
        answer170Kg = double.parse(b.toStringAsFixed(2));
      });
    } else {
      double a = storeINRMaund * 9.53;
      double b = (a / 355.60) * 170;

      setState(() {
        reverseanswerCandy = double.parse(a.toStringAsFixed(2));
        reverseanswer170Kg = double.parse(b.toStringAsFixed(2));
      });
    }
  }

  double kgs170answerMaund = 0;
  double kgs170answerCandy = 0;
  double reversekgs170answerMaund = 0;
  double reverseanswerCandtTo170Kgs = 0;
  final kgs170ToCandy = TextEditingController();
  final candyTo170kgs = TextEditingController();
  void _kgs170ToCandyRate() {
    double store170Kgs = double.tryParse(kgs170ToCandy.text) ?? 0;
    double storeINRCandy = double.tryParse(candyTo170kgs.text) ?? 0;
    if (reversekgstocandy) {
      double a = storeINRCandy / 9.53;
      double b = (storeINRCandy / 355.60) * 170;

      setState(() {
        reversekgs170answerMaund = double.parse(a.toStringAsFixed(2));
        reverseanswerCandtTo170Kgs = double.parse(b.toStringAsFixed(2));
      });
    } else {
      double b = (store170Kgs * 355.62) / 170;
      double a = b / 9.53;

      setState(() {
        kgs170answerMaund = double.parse(a.toStringAsFixed(2));
        kgs170answerCandy = double.parse(b.toStringAsFixed(2));
      });
    }
  }

  bool calulateLB = false;

  //chinese to indian
  bool chinesetoindina = false;
  bool reversechinesetoindina = false;

  //pakistan to indian
  bool pakistantoindian = false;
  bool reversepakistantoindian = false;

  //punjab to candy rate
  bool punjabtocandy = false;
  bool reversepanjabtocandy = false;

  //170 kgs to candy rate
  bool kgstocandy = false;
  bool reversekgstocandy = false;

  final inputkapas1 = TextEditingController();
  final inputexpense1 = TextEditingController();
  final inputoilrate1 = TextEditingController();
  final inputkapasia1 = TextEditingController();
  final inpututaro1 = TextEditingController();
  final inputghati1 = TextEditingController();

  final inputCNYTOn = TextEditingController();
  final inputExchangeRateChiense = TextEditingController();
  final inputINRCandy = TextEditingController();

  void chienseToIndianRate() {
    double storeINRCandy = double.tryParse(inputINRCandy.text) ?? 0;
    double storeExchangeRate =
        double.tryParse(inputExchangeRateChiense.text) ?? 0;
    double storeCNYTon = double.tryParse(inputCNYTOn.text) ?? 0;
    if (reversechinesetoindina) {
      // print('inside else');
      double a = storeINRCandy / 355.62;
      double b = a / storeExchangeRate;
      double c = b * 1000;
      setState(() {
        answerIndinaToCNY = double.parse(c.toStringAsFixed(2));
      });
    } else {
      // print('inside if');
      double a = storeCNYTon / 1000;
      double b = a * storeExchangeRate;
      double c = b * 355.62;
      setState(() {
        answerCNYToIndian = double.parse(c.toStringAsFixed(2));
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setPageName();
  }

  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'conversation_screen');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home_screen');
        return Future.value(false); // Allow popping the screen
      },
      child: Scaffold(
          appBar: const AppbarWithText(
            appbarText: 'Conversation',
            centerTitle: false,
            isBackButton: true,
          ),
          body: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 8.00)),

              //Cents/LB To Indian Rate
              expanstionTileConversation(
                  title: 'Cents/LB To Indian Rate',
                  isTileExpanded: true,
                  widget: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cents/LB -> Indian Rate',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40.sp),
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: reversecentstoindian,
                            // overlayColor: overlayColor,
                            // trackColor: trackColor,
                            // activeColor: Colors.blue,
                            // inactiveTrackColor: Colors.white,
                            // thumbColor:
                            //     const MaterialStatePropertyAll<Color>(
                            //         Colors.black),
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                reversecentstoindian = value;
                              });
                            },
                          ),
                          Text(
                            'Indian Rate -> Cents/LB',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40.sp),
                          ),
                        ],
                      ),
                      reversecentstoindian
                          ? Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'INR/Candy',
                                  controller: usCentsReverse,
                                  subtitle: '',
                                  onchaned: (string) {
                                    _centsToIndain();
                                  },
                                ),
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'Exchange Rate (USD/INR)',
                                  controller: exchnageRate,
                                  subtitle: 'Cents/LB',
                                  onchaned: (string) {
                                    _centsToIndain();
                                  },
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'US Cents/LB',
                                  result: answerCentsToIndinReverse,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'US Cents/LB',
                                  controller: usCents,
                                  subtitle: 'Cents/LB',
                                  onchaned: (string) {
                                    _centsToIndain();
                                  },
                                ),
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'Exchange Rate (USD/INR)',
                                  controller: exchnageRate,
                                  subtitle: 'Cents/LB',
                                  onchaned: (string) {
                                    _centsToIndain();
                                  },
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Candy',
                                  result: answerCentsToIndin,
                                ),
                              ],
                            )
                    ],
                  )),

              // Chiense Rate to indian rate
              expanstionTileConversation(
                  title: 'Chiense Rate To Indian Rate',
                  isTileExpanded: false,
                  widget: Column(
                    children: [
                      SwitchWithTwoText(
                        frontText: 'Chinese Rate -> Indian Rate',
                        backText: 'Indian Rate -> Chinese Rate',
                        onChange: (bool value) {
                          setState(() {
                            reversechinesetoindina = value;
                          });
                        },
                        switchValue: reversechinesetoindina,
                        bigText: false,
                      ),
                      reversechinesetoindina
                          ? Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'INR/Candy',
                                  controller: inputINRCandy,
                                  subtitle: '',
                                  onchaned: (string) {
                                    chienseToIndianRate();
                                  },
                                ),
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'Exchange Rate (CNY/INR)',
                                  controller: inputExchangeRateChiense,
                                  subtitle: '',
                                  onchaned: (string) {
                                    chienseToIndianRate();
                                  },
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'CNY/Ton',
                                  result: answerIndinaToCNY,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'CNY/Ton',
                                  controller: inputCNYTOn,
                                  subtitle: '',
                                  onchaned: (string) {
                                    chienseToIndianRate();
                                  },
                                ),
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'Exchange Rate (CNY/INR)',
                                  controller: inputExchangeRateChiense,
                                  subtitle: '',
                                  onchaned: (string) {
                                    chienseToIndianRate();
                                  },
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Candy',
                                  result: answerCNYToIndian,
                                ),
                              ],
                            )
                    ],
                  )),

              //punjab rate to candy rate
              expanstionTileConversation(
                  title: 'Punjab Rate To Candy rate',
                  isTileExpanded: false,
                  widget: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Punjab Rate -> Candy Rate',
                            maxLines: 3,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40.sp),
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: reversepanjabtocandy,
                            // overlayColor: overlayColor,
                            // trackColor: trackColor,
                            activeColor: Colors.blue,
                            inactiveTrackColor: Colors.white,
                            thumbColor: const MaterialStatePropertyAll<Color>(
                                Colors.black),
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                reversepanjabtocandy = value;
                              });
                            },
                          ),
                          Text(
                            'Candy Rate -> Punjab Rate',
                            maxLines: 3,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40.sp),
                          ),
                        ],
                      ),
                      reversepanjabtocandy
                          ? Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'INR/Candy',
                                  controller: indinaToPunjab,
                                  subtitle: '',
                                  onchaned: (string) {
                                    _punjabRateToIndina();
                                  },
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/170Kgs',
                                  result: answer170Kg,
                                ),
                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Maund',
                                  result: answerMaund,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'INR/Maund',
                                  controller: punjabToIndian,
                                  subtitle: '',
                                  onchaned: (string) {
                                    _punjabRateToIndina();
                                  },
                                ),
                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/170Kgs',
                                  result: reverseanswer170Kg,
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Candy',
                                  result: reverseanswerCandy,
                                ),
                              ],
                            )
                    ],
                  )),

              // 170 Kgs Rate To Candy Rate
              expanstionTileConversation(
                  title: '170 Kgs Rate To Candy Rate',
                  isTileExpanded: false,
                  widget: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '170Kgs Rate -> Candy Rate',
                            maxLines: 3,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40.sp),
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: reversekgstocandy,
                            // overlayColor: overlayColor,
                            // trackColor: trackColor,
                            activeColor: Colors.blue,
                            inactiveTrackColor: Colors.white,
                            thumbColor: const MaterialStatePropertyAll<Color>(
                                Colors.black),
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                reversekgstocandy = value;
                              });
                            },
                          ),
                          Text(
                            'Candy Rate -> 170Kgs Rate',
                            maxLines: 3,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 40.sp),
                          ),
                        ],
                      ),
                      reversekgstocandy
                          ? Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'INR/Candy',
                                  controller: candyTo170kgs,
                                  subtitle: '',
                                  onchaned: (string) {
                                    _kgs170ToCandyRate();
                                  },
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Maund',
                                  result: reversekgs170answerMaund,
                                ),
                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/170Kgs',
                                  result: reverseanswerCandtTo170Kgs,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                GlobalRowWidgetWithOnchangedForCurency(
                                  height: globalSingalTextfiedHeight,
                                  width: globalSingalTextfiedWidth,
                                  title: 'INR/170Kgs',
                                  controller: kgs170ToCandy,
                                  subtitle: '',
                                  onchaned: (string) {
                                    _kgs170ToCandyRate();
                                  },
                                ),
                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Maund',
                                  result: kgs170answerMaund,
                                ),

                                //result
                                GlobalResultBuilderForResults(
                                  substreamtext: '',
                                  streamtitletext: 'INR/Candy',
                                  result: kgs170answerCandy,
                                ),
                              ],
                            )
                    ],
                  )),

              expanstionTileConversation(
                  title: '170 Kgs Rate To Candy Rate',
                  isTileExpanded: false,
                  widget: Column()),
            ],
          )),
    );
  }
}

class expanstionTileConversation extends StatelessWidget {
  final String title;
  final Widget widget;
  final bool isTileExpanded;
  const expanstionTileConversation(
      {super.key,
      required this.title,
      required this.widget,
      required this.isTileExpanded});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        initiallyExpanded: isTileExpanded,
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.00),
            child: widget,
          )
        ],
      ),
    );
  }
}
