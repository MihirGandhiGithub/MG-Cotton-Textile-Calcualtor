import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_slider.dart';
import '../../../Constants/Global_Widgets/Buttons/simple_text.dart';
import '../../../Constants/Global_Widgets/TextFormField/textformfield_cutting_coast.dart';
import '../../../Constants/Global_Widgets/Row/three_content.dart';
import '../../../StageManagementClass/provider_state_management.dart';
import 'package:provider/provider.dart';

class HomeDabietCalculation extends StatefulWidget {
  const HomeDabietCalculation({Key? key}) : super(key: key);

  @override
  State<HomeDabietCalculation> createState() => _HomeDabietCalculationState();
}

class _HomeDabietCalculationState extends State<HomeDabietCalculation>
    with SingleTickerProviderStateMixin {
  ScreenshotController screenshotController = ScreenshotController();
  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'dabitnote_screen');
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setPageName();
  }

  @override
  Widget build(BuildContext context) {
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
              titleText: 'Cotton Debit Note',
              sliderText1: 'Calculator 1',
              sliderText2: 'Calculator 2',
              isBackButton: true,
            ),
            body: const TabBarView(
              children: [
                Calculation1(),
                Calculation2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Calculation1 extends StatefulWidget {
  const Calculation1({super.key});

  @override
  State<Calculation1> createState() => Calculation1State();
}

class Calculation1State extends State<Calculation1> {
  String answerBillAmount = '0';
  double tempanswerBillAmount = 0;
  String answerGstOnBill = '0';
  String answerBillAmountWithGst = '0';

  String answerMic = '0';
  String answerRd = '0';
  String answerLength = '0';
  String answerStrength = '0';
  String answerMoisture = '0';
  String answerTrash = '0';

  String answerIntrest = '0';

  String answerDebitTotal = '0';

  double tempanswerMic = 0;
  double tempanswerRd = 0;
  double tempanswerLength = 0;
  double tempanswerStrength = 0;
  double tempanswerMoisture = 0;
  double tempanswerTrash = 0;

  double tempanswerIntrest = 0;

  double tempanswerDebitTotal = 0;

  String debietNoteGst = '0';
  double tempdebietNoteGst = 0;

  String debietNoteWithGst = '0';
  double tempdebietNoteWithGst = 0;

  String finalBillAmount = '0';
  double tempfinalBillAmount = 0;

  void billAmount() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;

    if (storeInputCottonRate != 0 && storeInputWeight != 0) {
      double RateMultiplyWeight = storeInputCottonRate * storeInputWeight;
      double billAmount = (RateMultiplyWeight * 0.2812) / 100;

      double gst = (billAmount / 100) * 5;
      double billAmountWithGst = billAmount + gst;

      setState(() {
        answerBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(billAmount.toStringAsFixed(2)));
        answerGstOnBill = NumberFormat.decimalPattern()
            .format(double.parse(gst.toStringAsFixed(2)));
        tempanswerBillAmount = billAmountWithGst;
        answerBillAmountWithGst = NumberFormat.decimalPattern()
            .format(double.parse(billAmountWithGst.toStringAsFixed(2)));
      });
    } else {
      setState(() {
        answerBillAmount = '0';
        answerGstOnBill = '0';
        tempanswerBillAmount = 0;
        answerBillAmountWithGst = '0';
      });
    }
  }

  int customStoreValueForAll(double value) {
    if (value == value.toInt().toDouble()) {
      // If the value is a whole number (e.g., 2), store it as is.
      return value.toInt();
    } else {
      // If the value has a decimal point (e.g., 0.2 or 2.2),
      // multiply it by 10 and store it as an integer.
      return (value * 10).toInt();
    }
  }

  void lengthAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;

    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputMicFix = double.tryParse(lengthFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(lengthEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(lengthAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerMic = 0.toString();
        tempanswerLength = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      print(a);
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2
      print(intValue1);

      double b = intValue1 * storeInputMicAMount; //200
      print(b);
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerLength = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerLength = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void strengthAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;

    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputMicFix = double.tryParse(strengthFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(strengthEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(strengthAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerMic = 0.toString();
        tempanswerStrength = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      if (kDebugMode) {
        if (kDebugMode) {
          print(a);
        }
      }
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2
      print(intValue1);

      double b = intValue1 * storeInputMicAMount; //200
      if (kDebugMode) {
        if (kDebugMode) {
          print(b);
        }
      }
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerStrength = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerStrength = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void micAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;

    double storeInputMicFix = double.tryParse(micFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(micEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(micAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerMic = 0.toString();
        tempanswerMic = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      if (kDebugMode) {
        print(a);
      }
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2
      if (kDebugMode) {
        print(intValue1);
      }

      double b = intValue1 * storeInputMicAMount; //200
      print(b);
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerMic = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerMic = c;
        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));

        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        print(tempanswerBillAmount);
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void rdAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;

    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputMicFix = double.tryParse(rdFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(rdEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(rdAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerRd = 0.toString();
        tempanswerRd = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      print(a);
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2

      double b = intValue1 * storeInputMicAMount; //200

      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerRd = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerRd = c;
        //
        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        print(tempanswerDebitTotal);

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void trashAmountCalculation() {
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputMicFix = double.tryParse(trashFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(trashEnterd.text) ?? 0;

    if (storeInputMicFix >= storeInputMicEntered ||
        storeInputMicEntered == 0 ||
        storeInputMicFix == 0 ||
        storeInputWeight == 0 ||
        storeInputCottonRate == 0) {
      setState(() {
        answerTrash = 0.toString();
        tempanswerTrash = 0;
      });
    } else {
      double a = (storeInputMicEntered - storeInputMicFix); //1
      print(a);

      double b = (storeInputCottonRate / 100) * a;
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      if (kDebugMode) {
        print(c);
      }

      setState(() {
        answerTrash = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerTrash = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void moistureAmountCalculation() {
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputMicFix = double.tryParse(moistureFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(moistureEnterd.text) ?? 0;

    if (storeInputMicFix >= storeInputMicEntered ||
        storeInputMicEntered == 0 ||
        storeInputMicFix == 0 ||
        storeInputWeight == 0 ||
        storeInputCottonRate == 0) {
      setState(() {
        answerMoisture = 0.toString();
        tempanswerMoisture = 0;
      });
    } else {
      double a = (storeInputMicEntered - storeInputMicFix); //1
      if (kDebugMode) {
        print(a);
      }

      double b = (storeInputCottonRate / 100) * a;
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      if (kDebugMode) {
        print(c);
      }

      setState(() {
        answerMoisture = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerMoisture = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void IntrestAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputpercent = double.tryParse(intrestPercent.text) ?? 0;
    double storeInputAmount = double.tryParse(intrestAmount.text) ?? 0;
    double storeInputDay = double.tryParse(intrestDay.text) ?? 0;

    double temppercent = (storeInputAmount / 100) * storeInputpercent;

    double a = (temppercent / 365) * storeInputDay;

    if (storeInputpercent != 0 &&
        storeInputAmount != 0 &&
        storeInputDay != 0 &&
        storeInputCottonRate != 0 &&
        storeInputWeight != 0) {
      setState(() {
        answerIntrest = NumberFormat.decimalPattern()
            .format(double.parse(a.toStringAsFixed(2)));
        tempanswerIntrest = a;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    } else {
      setState(() {
        answerIntrest = '0';
        tempanswerIntrest = 0;
      });
    }
  }

  double customStoreValue(double value) {
    if (value < 1.0) {
      // For values less than 1.0, round to the nearest integer.
      return (value + 0.5).toInt().toDouble();
    } else {
      // For values greater than or equal to 1.0, round to one decimal place.
      return (value * 10).round() / 10;
    }
  }

  final cottonRate = TextEditingController();
  final cottonWeight = TextEditingController();

  final micFix = TextEditingController();
  final micEnterd = TextEditingController();
  final micAmount = TextEditingController();

  final rdFix = TextEditingController();
  final rdEnterd = TextEditingController();
  final rdAmount = TextEditingController();

  final lengthFix = TextEditingController();
  final lengthEnterd = TextEditingController();
  final lengthAmount = TextEditingController();

  final strengthFix = TextEditingController();
  final strengthEnterd = TextEditingController();
  final strengthAmount = TextEditingController();

  final moistureFix = TextEditingController();
  final moistureEnterd = TextEditingController();

  final trashFix = TextEditingController();
  final trashEnterd = TextEditingController();

  final intrestPercent = TextEditingController();
  final intrestAmount = TextEditingController();
  final intrestDay = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthFix.text = 29.toString();
    strengthFix.text = 29.toString();
    micFix.text = 3.8.toString();
    rdFix.text = 75.toString();
    trashFix.text = 3.toString();
    moistureFix.text = 9.toString();
    intrestPercent.text = 15.toString();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListView(
      children: [
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Cotton Rate',
          controller: cottonRate,
          subtitle: '₹/Candy',
          onchaned: (string) {
            billAmount();
            micAmountCalculation();
            rdAmountCalculation();
            lengthAmountCalculation();
            strengthAmountCalculation();
            moistureAmountCalculation();
            trashAmountCalculation();
            IntrestAmountCalculation();
          },
        ),

        // Expenses
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Weight',
          controller: cottonWeight,
          subtitle: 'Kg',
          onchaned: (string) {
            billAmount();
            micAmountCalculation();
            rdAmountCalculation();
            lengthAmountCalculation();
            strengthAmountCalculation();
            moistureAmountCalculation();
            trashAmountCalculation();
            IntrestAmountCalculation();
          },
        ),

        // Stram result Export Rate 1
        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Bill Amount',
          result: answerBillAmount,
        ),
        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Gst On Bill',
          result: answerGstOnBill,
        ),
        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Bill Amount + GST',
          result: answerBillAmountWithGst,
        ),

        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Container(
            margin: EdgeInsets.all(10.sp),
            padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(50.sp),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: Text('Debit Note',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 80.sp,
                      )),
                ),
                textformfield_cutting_coast(
                  title: 'Length',
                  controllerFix: lengthFix,
                  controllerEnterd: lengthEnterd,
                  controllerAmount: lengthAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    lengthAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    lengthAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    lengthAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Length Charges',
                  result: answerLength,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast(
                  title: 'Strength',
                  controllerFix: strengthFix,
                  controllerEnterd: strengthEnterd,
                  controllerAmount: strengthAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    strengthAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    strengthAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    strengthAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Strngth Charges',
                  result: answerStrength,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast(
                  title: 'Mic',
                  controllerFix: micFix,
                  controllerEnterd: micEnterd,
                  controllerAmount: micAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    micAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    micAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    micAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Mic Charges',
                  result: answerMic,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast(
                  title: 'RD',
                  controllerFix: rdFix,
                  controllerEnterd: rdEnterd,
                  controllerAmount: rdAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    rdAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    rdAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    rdAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'RD Charges',
                  result: answerRd,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast_percentage(
                    title: 'Trash %',
                    controllerFix: trashFix,
                    controllerEnterd: trashEnterd,
                    isLastField: false,
                    numberKeyboard: true,
                    onChangedFix: (value) {
                      trashAmountCalculation();
                    },
                    onChangedEnterd: (value) {
                      trashAmountCalculation();
                    }),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Trash Charges',
                  result: answerTrash,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast_percentage(
                    title: 'Moisture %',
                    controllerFix: moistureFix,
                    controllerEnterd: moistureEnterd,
                    isLastField: false,
                    numberKeyboard: true,
                    onChangedFix: (value) {
                      moistureAmountCalculation();
                    },
                    onChangedEnterd: (value) {
                      moistureAmountCalculation();
                    }),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Moisture Charges',
                  result: answerMoisture,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast_intrest(
                  controllerFix: intrestPercent,
                  controllerEnterd: intrestAmount,
                  controllerAmount: intrestDay,
                  onChangedFix: (value) {
                    IntrestAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    IntrestAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    IntrestAmountCalculation();
                  },
                  isLastField: true,
                  numberKeyboard: true,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Intrest Charges',
                  result: answerIntrest,
                ),
                SizedBox(
                  height: 40.h,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Debiet Note Total',
                  result: answerDebitTotal,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Debiet Gst',
                  result: debietNoteGst,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Debiet Note + GST',
                  result: debietNoteWithGst,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Text('Amount After Removing Debit Note',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 60.sp,
              )),
        ),

        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Final Amount',
          result: finalBillAmount,
        ),

        // Reset Button
        GlobalButtonSimpleText(
          onPressed: () {
            setState(() {
              answerBillAmount = '0';
              tempanswerBillAmount = 0;
              answerGstOnBill = '0';
              answerBillAmountWithGst = '0';

              answerMic = '0';
              answerRd = '0';
              answerLength = '0';
              answerStrength = '0';
              answerMoisture = '0';
              answerTrash = '0';

              answerIntrest = '0';

              answerDebitTotal = '0';

              tempanswerMic = 0;
              tempanswerRd = 0;
              tempanswerLength = 0;
              tempanswerStrength = 0;
              tempanswerMoisture = 0;
              tempanswerTrash = 0;

              tempanswerIntrest = 0;

              tempanswerDebitTotal = 0;

              debietNoteGst = '0';
              tempdebietNoteGst = 0;

              debietNoteWithGst = '0';
              tempdebietNoteWithGst = 0;

              finalBillAmount = '0';
              tempfinalBillAmount = 0;

              lengthFix.text = 29.toString();
              strengthFix.text = 29.toString();
              micFix.text = 3.8.toString();
              rdFix.text = 75.toString();
              trashFix.text = 3.toString();
              moistureFix.text = 9.toString();
              intrestPercent.text = 15.toString();

              cottonRate.clear();
              cottonWeight.clear();

              micEnterd.clear();
              micAmount.clear();

              rdEnterd.clear();
              rdAmount.clear();

              lengthEnterd.clear();
              lengthAmount.clear();

              strengthEnterd.clear();
              strengthAmount.clear();

              moistureEnterd.clear();
              trashEnterd.clear();

              intrestAmount.clear();
              intrestDay.clear();
            });
          },
          buttontext: 'Reset',
          height: globalSingalResetButtonHeight,
          width: globalSingalResetButtonWidth,
        ),
      ],
    );
  }
}

class Calculation2 extends StatefulWidget {
  const Calculation2({super.key});

  @override
  State<Calculation2> createState() => _Calculation2State();
}

class _Calculation2State extends State<Calculation2> {
  String answerBillAmount = '0';
  double tempanswerBillAmount = 0;
  String answerGstOnBill = '0';
  String answerBillAmountWithGst = '0';

  String answerMic = '0';
  String answerRd = '0';
  String answerLength = '0';
  String answerStrength = '0';
  String answerMoisture = '0';
  String answerTrash = '0';

  String answerIntrest = '0';

  String answerDebitTotal = '0';

  double tempanswerMic = 0;
  double tempanswerRd = 0;
  double tempanswerLength = 0;
  double tempanswerStrength = 0;
  double tempanswerMoisture = 0;
  double tempanswerTrash = 0;

  double tempanswerIntrest = 0;

  double tempanswerDebitTotal = 0;

  String debietNoteGst = '0';
  double tempdebietNoteGst = 0;

  String debietNoteWithGst = '0';
  double tempdebietNoteWithGst = 0;

  String finalBillAmount = '0';
  double tempfinalBillAmount = 0;

  void billAmount() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;

    if (storeInputCottonRate != 0 && storeInputWeight != 0) {
      double RateMultiplyWeight = storeInputCottonRate * storeInputWeight;
      double billAmount = (RateMultiplyWeight * 0.2812) / 100;

      double gst = (billAmount / 100) * 5;
      double billAmountWithGst = billAmount + gst;

      setState(() {
        answerBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(billAmount.toStringAsFixed(2)));
        answerGstOnBill = NumberFormat.decimalPattern()
            .format(double.parse(gst.toStringAsFixed(2)));
        tempanswerBillAmount = billAmountWithGst;
        answerBillAmountWithGst = NumberFormat.decimalPattern()
            .format(double.parse(billAmountWithGst.toStringAsFixed(2)));
      });
    } else {
      setState(() {
        answerBillAmount = '0';
        answerGstOnBill = '0';
        tempanswerBillAmount = 0;
        answerBillAmountWithGst = '0';
      });
    }
  }

  int customStoreValueForAll(double value) {
    if (value == value.toInt().toDouble()) {
      // If the value is a whole number (e.g., 2), store it as is.
      return value.toInt();
    } else {
      // If the value has a decimal point (e.g., 0.2 or 2.2),
      // multiply it by 10 and store it as an integer.
      return (value * 10).toInt();
    }
  }

  void lengthAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;

    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputMicFix = double.tryParse(lengthFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(lengthEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(lengthAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerMic = 0.toString();
        tempanswerLength = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      if (kDebugMode) {
        print(a);
      }
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2
      print(intValue1);

      double b = intValue1 * storeInputMicAMount; //200
      if (kDebugMode) {
        print(b);
      }
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerLength = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerLength = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void strengthAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;

    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputMicFix = double.tryParse(strengthFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(strengthEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(strengthAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerMic = 0.toString();
        tempanswerStrength = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      if (kDebugMode) {
        print(a);
      }
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2
      if (kDebugMode) {
        print(intValue1);
      }

      double b = intValue1 * storeInputMicAMount; //200
      if (kDebugMode) {
        print(b);
      }
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerStrength = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerStrength = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void micAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;

    double storeInputMicFix = double.tryParse(micFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(micEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(micAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerMic = 0.toString();
        tempanswerMic = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      if (kDebugMode) {
        print(a);
      }
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2
      if (kDebugMode) {
        print(intValue1);
      }

      double b = intValue1 * storeInputMicAMount; //200
      if (kDebugMode) {
        print(b);
      }
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerMic = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerMic = c;
        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        print(tempanswerDebitTotal);

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));

        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        if (kDebugMode) {
          print(tempanswerBillAmount);
        }
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void rdAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;

    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputMicFix = double.tryParse(rdFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(rdEnterd.text) ?? 0;
    double storeInputMicAMount = double.tryParse(rdAmount.text) ?? 0;

    if (storeInputMicFix <= storeInputMicEntered ||
        storeInputMicFix == 0 ||
        storeInputMicEntered == 0 ||
        storeInputCottonRate == 0 ||
        storeInputWeight == 0 ||
        storeInputMicAMount == 0) {
      setState(() {
        answerRd = 0.toString();
        tempanswerRd = 0;
      });
    } else {
      double a = (storeInputMicFix - storeInputMicEntered); //0.2
      if (kDebugMode) {
        print(a);
      }
      int intValue1 = customStoreValueForAll(
          double.parse(a.toStringAsFixed(2))); // Converts 0.2 to 2

      double b = intValue1 * storeInputMicAMount; //200

      double c = (storeInputWeight * b * 0.2812) / 100;
      setState(() {
        answerRd = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerRd = c;
        //
        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        if (kDebugMode) {
          print(tempanswerDebitTotal);
        }

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        print(tempanswerBillAmount);
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void trashAmountCalculation() {
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputMicFix = double.tryParse(trashFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(trashEnterd.text) ?? 0;

    if (storeInputMicFix >= storeInputMicEntered ||
        storeInputMicEntered == 0 ||
        storeInputMicFix == 0 ||
        storeInputWeight == 0 ||
        storeInputCottonRate == 0) {
      setState(() {
        answerTrash = 0.toString();
        tempanswerTrash = 0;
      });
    } else {
      double a = (storeInputMicEntered - storeInputMicFix); //1
      print(a);

      double b = (storeInputCottonRate / 100) * a;
      if (kDebugMode) {
        print(b);
      }
      double c = (storeInputWeight * b * 0.2812) / 100;
      print(c);

      setState(() {
        answerTrash = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerTrash = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        print(tempanswerDebitTotal);

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        print(tempanswerBillAmount);
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void moistureAmountCalculation() {
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputMicFix = double.tryParse(moistureFix.text) ?? 0;
    double storeInputMicEntered = double.tryParse(moistureEnterd.text) ?? 0;

    if (storeInputMicFix >= storeInputMicEntered ||
        storeInputMicEntered == 0 ||
        storeInputMicFix == 0 ||
        storeInputWeight == 0 ||
        storeInputCottonRate == 0) {
      setState(() {
        answerMoisture = 0.toString();
        tempanswerMoisture = 0;
      });
    } else {
      double a = (storeInputMicEntered - storeInputMicFix); //1
      print(a);

      double b = (storeInputCottonRate / 100) * a;
      print(b);
      double c = (storeInputWeight * b * 0.2812) / 100;
      print(c);

      setState(() {
        answerMoisture = NumberFormat.decimalPattern()
            .format(double.parse(c.toStringAsFixed(2)));
        tempanswerMoisture = c;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        print(tempanswerDebitTotal);

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        print(tempanswerBillAmount);
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    }
  }

  void IntrestAmountCalculation() {
    double storeInputCottonRate = double.tryParse(cottonRate.text) ?? 0;
    double storeInputWeight = double.tryParse(cottonWeight.text) ?? 0;
    double storeInputpercent = double.tryParse(intrestPercent.text) ?? 0;
    double storeInputAmount = double.tryParse(intrestAmount.text) ?? 0;
    double storeInputDay = double.tryParse(intrestDay.text) ?? 0;

    double temppercent = (storeInputAmount / 100) * storeInputpercent;

    double a = (temppercent / 365) * storeInputDay;

    if (storeInputpercent != 0 &&
        storeInputAmount != 0 &&
        storeInputDay != 0 &&
        storeInputCottonRate != 0 &&
        storeInputWeight != 0) {
      setState(() {
        answerIntrest = NumberFormat.decimalPattern()
            .format(double.parse(a.toStringAsFixed(2)));
        tempanswerIntrest = a;

        tempanswerDebitTotal = tempanswerMic +
            tempanswerRd +
            tempanswerLength +
            tempanswerStrength +
            tempanswerMoisture +
            tempanswerTrash +
            tempanswerIntrest;
        print(tempanswerDebitTotal);

        answerDebitTotal = NumberFormat.decimalPattern()
            .format(double.parse(tempanswerDebitTotal.toStringAsFixed(2)));
        tempdebietNoteGst = (tempanswerDebitTotal / 100) * 5;
        debietNoteGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteGst.toStringAsFixed(2)));

        tempdebietNoteWithGst = tempanswerDebitTotal + tempdebietNoteGst;
        debietNoteWithGst = NumberFormat.decimalPattern()
            .format(double.parse(tempdebietNoteWithGst.toStringAsFixed(2)));

        tempfinalBillAmount = tempanswerBillAmount - tempdebietNoteWithGst;
        print(tempanswerBillAmount);
        finalBillAmount = NumberFormat.decimalPattern()
            .format(double.parse(tempfinalBillAmount.toStringAsFixed(2)));
      });
    } else {
      setState(() {
        answerIntrest = '0';
        tempanswerIntrest = 0;
      });
    }
  }

  double customStoreValue(double value) {
    if (value < 1.0) {
      // For values less than 1.0, round to the nearest integer.
      return (value + 0.5).toInt().toDouble();
    } else {
      // For values greater than or equal to 1.0, round to one decimal place.
      return (value * 10).round() / 10;
    }
  }

  final cottonRate = TextEditingController();
  final cottonWeight = TextEditingController();

  final micFix = TextEditingController();
  final micEnterd = TextEditingController();
  final micAmount = TextEditingController();

  final rdFix = TextEditingController();
  final rdEnterd = TextEditingController();
  final rdAmount = TextEditingController();

  final lengthFix = TextEditingController();
  final lengthEnterd = TextEditingController();
  final lengthAmount = TextEditingController();

  final strengthFix = TextEditingController();
  final strengthEnterd = TextEditingController();
  final strengthAmount = TextEditingController();

  final moistureFix = TextEditingController();
  final moistureEnterd = TextEditingController();

  final trashFix = TextEditingController();
  final trashEnterd = TextEditingController();

  final intrestPercent = TextEditingController();
  final intrestAmount = TextEditingController();
  final intrestDay = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthFix.text = 29.toString();
    strengthFix.text = 29.toString();
    micFix.text = 3.8.toString();
    rdFix.text = 75.toString();
    trashFix.text = 3.toString();
    moistureFix.text = 9.toString();
    intrestPercent.text = 15.toString();
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
            billAmount();
            micAmountCalculation();
            rdAmountCalculation();
            lengthAmountCalculation();
            strengthAmountCalculation();
            moistureAmountCalculation();
            trashAmountCalculation();
            IntrestAmountCalculation();
          },
        ),

        // Expenses
        GlobalRowWidgetWithOnchanged(
          height: globalSingalTextfiedHeight,
          width: globalSingalTextfiedWidth,
          title: 'Weight',
          controller: cottonWeight,
          subtitle: 'Kg',
          onchaned: (string) {
            billAmount();
            micAmountCalculation();
            rdAmountCalculation();
            lengthAmountCalculation();
            strengthAmountCalculation();
            moistureAmountCalculation();
            trashAmountCalculation();
            IntrestAmountCalculation();
          },
        ),

        // Stram result Export Rate 1
        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Bill Amount',
          result: answerBillAmount,
        ),
        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Gst On Bill',
          result: answerGstOnBill,
        ),
        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Bill Amount + GST',
          result: answerBillAmountWithGst,
        ),

        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Container(
            margin: EdgeInsets.all(10.sp),
            padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(50.sp),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: Text('Debit Note',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 80.sp,
                      )),
                ),
                textformfield_cutting_coast(
                  title: 'Length',
                  controllerFix: lengthFix,
                  controllerEnterd: lengthEnterd,
                  controllerAmount: lengthAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    lengthAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    lengthAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    lengthAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Length Charges',
                  result: answerLength,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast(
                  title: 'Strength',
                  controllerFix: strengthFix,
                  controllerEnterd: strengthEnterd,
                  controllerAmount: strengthAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    strengthAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    strengthAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    strengthAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Strngth Charges',
                  result: answerStrength,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast(
                  title: 'Mic',
                  controllerFix: micFix,
                  controllerEnterd: micEnterd,
                  controllerAmount: micAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    micAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    micAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    micAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Mic Charges',
                  result: answerMic,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast(
                  title: 'RD',
                  controllerFix: rdFix,
                  controllerEnterd: rdEnterd,
                  controllerAmount: rdAmount,
                  isLastField: false,
                  numberKeyboard: true,
                  onChangedFix: (value) {
                    rdAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    rdAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    rdAmountCalculation();
                  },
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'RD Charges',
                  result: answerRd,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast_percentage(
                    title: 'Trash %',
                    controllerFix: trashFix,
                    controllerEnterd: trashEnterd,
                    isLastField: false,
                    numberKeyboard: true,
                    onChangedFix: (value) {
                      trashAmountCalculation();
                    },
                    onChangedEnterd: (value) {
                      trashAmountCalculation();
                    }),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Trash Charges',
                  result: answerTrash,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast_percentage(
                    title: 'Moisture %',
                    controllerFix: moistureFix,
                    controllerEnterd: moistureEnterd,
                    isLastField: false,
                    numberKeyboard: true,
                    onChangedFix: (value) {
                      moistureAmountCalculation();
                    },
                    onChangedEnterd: (value) {
                      moistureAmountCalculation();
                    }),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Moisture Charges',
                  result: answerMoisture,
                ),
                SizedBox(
                  height: 30.h,
                ),
                textformfield_cutting_coast_intrest(
                  controllerFix: intrestPercent,
                  controllerEnterd: intrestAmount,
                  controllerAmount: intrestDay,
                  onChangedFix: (value) {
                    IntrestAmountCalculation();
                  },
                  onChangedEnterd: (value) {
                    IntrestAmountCalculation();
                  },
                  onChangedAMount: (value) {
                    IntrestAmountCalculation();
                  },
                  isLastField: true,
                  numberKeyboard: true,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Intrest Charges',
                  result: answerIntrest,
                ),
                SizedBox(
                  height: 40.h,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Debiet Note Total',
                  result: answerDebitTotal,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Debiet Gst',
                  result: debietNoteGst,
                ),
                GlobalResultBuilderForResults(
                  substreamtext: '₹',
                  streamtitletext: 'Debiet Note With GST',
                  result: debietNoteWithGst,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Text('Amount After Removing Debit Note',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 60.sp,
              )),
        ),

        GlobalResultBuilderForResults(
          substreamtext: '₹',
          streamtitletext: 'Final Amount',
          result: finalBillAmount,
        ),

        // Reset Button
        GlobalButtonSimpleText(
          onPressed: () {
            setState(() {
              answerBillAmount = '0';
              tempanswerBillAmount = 0;
              answerGstOnBill = '0';
              answerBillAmountWithGst = '0';

              answerMic = '0';
              answerRd = '0';
              answerLength = '0';
              answerStrength = '0';
              answerMoisture = '0';
              answerTrash = '0';

              answerIntrest = '0';

              answerDebitTotal = '0';

              tempanswerMic = 0;
              tempanswerRd = 0;
              tempanswerLength = 0;
              tempanswerStrength = 0;
              tempanswerMoisture = 0;
              tempanswerTrash = 0;

              tempanswerIntrest = 0;

              tempanswerDebitTotal = 0;

              debietNoteGst = '0';
              tempdebietNoteGst = 0;

              debietNoteWithGst = '0';
              tempdebietNoteWithGst = 0;

              finalBillAmount = '0';
              tempfinalBillAmount = 0;

              lengthFix.text = 29.toString();
              strengthFix.text = 29.toString();
              micFix.text = 3.8.toString();
              rdFix.text = 75.toString();
              trashFix.text = 3.toString();
              moistureFix.text = 9.toString();
              intrestPercent.text = 15.toString();

              cottonRate.clear();
              cottonWeight.clear();

              micEnterd.clear();
              micAmount.clear();

              rdEnterd.clear();
              rdAmount.clear();

              lengthEnterd.clear();
              lengthAmount.clear();

              strengthEnterd.clear();
              strengthAmount.clear();

              moistureEnterd.clear();
              trashEnterd.clear();

              intrestAmount.clear();
              intrestDay.clear();
            });
          },
          buttontext: 'Reset',
          height: globalSingalResetButtonHeight,
          width: globalSingalResetButtonWidth,
        ),
      ],
    );
  }
}

class GlobalResultBuilderForResults extends StatelessWidget {
  final String result;
  final String substreamtext;
  final String streamtitletext;

  const GlobalResultBuilderForResults(
      {super.key,
      required this.substreamtext,
      required this.streamtitletext,
      required this.result});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      // height: 120.h,
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h, bottom: 30.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        color: themeProvider.themeMode.name == 'Light'
            ? Colors.grey[200]
            : Colors.white10,
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 500.w,
            child: Text(
              streamtitletext + ':',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.themeMode.name == 'Light'
                      ? Colors.black
                      : Colors.white70),
            ),
          ),
          Tooltip(
            message: '$result' ' $substreamtext',
            child: GradientText(
              '$result' ' $substreamtext',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 55.sp,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.white60,
                themeProvider.themeMode.name == 'Light'
                    ? Colors.black
                    : Colors.blueGrey
              ],
            ),
          ),
        ],
      ),
    );
  }
}
