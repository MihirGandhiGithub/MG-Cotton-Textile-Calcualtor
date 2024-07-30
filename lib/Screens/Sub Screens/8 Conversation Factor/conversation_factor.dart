import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/Global_Variables/colors/colors.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_with_text.dart';

class ConversationFactor extends StatefulWidget {
  const ConversationFactor({super.key});

  @override
  State<ConversationFactor> createState() => _ConversationFactorState();
}

class _ConversationFactorState extends State<ConversationFactor> {
  bool setcolor = true;
  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'cottonfactor_screen');
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
      child: Scaffold(
        appBar: const AppbarWithText(
          appbarText: 'Conversation Factor',
          centerTitle: false,
          isBackButton: true,
        ),
        body: Column(
          children: [
            // Heading with 4 Name
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 150.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 380.w,
                    child: Tooltip(
                      message: 'Particulars',
                      child: Text(
                        'Particulars',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                          // color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350.w,
                    child: Tooltip(
                      message: 'Kilograms',
                      child: Text(
                        'Kilograms',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                          // color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Tooltip(
                      message: 'Pound',
                      child: Text(
                        'Pound',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                          // color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: '480 lb Bales',
                    child: Text(
                      '480 lb Bales',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                        // color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                CCFExpanstionList(
                  one: 'Ton (Metric)',
                  two: '1.000',
                  three: '2204.6',
                  four: '4.593',
                ),
                CCFExpanstionList(
                  one: 'Pound',
                  two: '0.4536',
                  three: '1',
                  four: '480',
                ),
                CCFExpanstionList(
                  one: 'Kilogram',
                  two: '1',
                  three: '2.2046',
                  four: '0.004593',
                ),
                CCFExpanstionList(
                  one: 'Arroba (Brazil)',
                  two: '15',
                  three: '33.069',
                  four: '0.0689',
                ),
                CCFExpanstionList(
                  one: 'Candy (India)',
                  two: '355.62',
                  three: '784',
                  four: '1.6333',
                ),
                CCFExpanstionList(
                  one: 'Cantar, Metric (Egypt)',
                  two: '50',
                  three: '110.23',
                  four: '0.2296',
                ),
                CCFExpanstionList(
                  one: 'Cantar (Sudan)',
                  two: '44.93',
                  three: '99.05',
                  four: '0.20635',
                ),
                CCFExpanstionList(
                  one: 'Centner (Soviet Union)',
                  two: '100',
                  three: '220.46',
                  four: '0.4593',
                ),
                CCFExpanstionList(
                  one: 'Dan (China)',
                  two: '50',
                  three: '110.23',
                  four: '0.2296',
                ),
                CCFExpanstionList(
                  one: 'Quintal (Argentina)',
                  two: '45.95',
                  three: '101.3',
                  four: '0.211',
                ),
                CCFExpanstionList(
                  one: 'Quintal (India)',
                  two: '100',
                  three: '220.46',
                  four: '0.4593',
                ),
                CCFExpanstionList(
                  one: 'Quintal (Mexico)',
                  two: '46.026',
                  three: '101.47',
                  four: '0.2114',
                ),
                CCFExpanstionList(
                  one: 'Quintal (Peru, Spain)',
                  two: '46',
                  three: '101.41',
                  four: '0.2113',
                ),
                CCFExpanstionList(
                  one: 'Long Ton',
                  two: '1.016',
                  three: '2.240',
                  four: '4.666',
                ),
                CCFExpanstionList(
                  one: 'Maund (Pakistan)',
                  two: '37.3242',
                  three: '82.286',
                  four: '0.1714',
                ),
                CCFExpanstionList(
                  one: 'picul (China)',
                  two: '50',
                  three: '110.23',
                  four: '0.2296',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class CCFExpanstionList extends StatefulWidget {
  final String one;
  final String two;
  final String three;
  final String four;

  const CCFExpanstionList(
      {super.key,
      required this.one,
      required this.two,
      required this.three,
      required this.four});

  @override
  State<CCFExpanstionList> createState() => _CCFExpanstionListtState();
}

class _CCFExpanstionListtState extends State<CCFExpanstionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: universalGray,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 350.w,
            child: Tooltip(
              message: widget.one,
              child: Text(
                widget.one,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 50.sp,
                    // color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 350.w,
            child: Tooltip(
              message: widget.two,
              child: Text(
                widget.two,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 50.sp,
                  // color: Colors.black
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 300.w,
            child: Tooltip(
              message: widget.three,
              child: Text(
                widget.three,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 50.sp,
                  // color: Colors.black
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50.w,
          ),
          Expanded(
            child: Tooltip(
              message: widget.four,
              child: Text(
                widget.four,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.sp,
                  // color: Colors.black
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
