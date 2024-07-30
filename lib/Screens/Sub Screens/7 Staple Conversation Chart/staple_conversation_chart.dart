import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Constants/Global_Widgets/Appbar/appbar_with_text.dart';
import '../../../Constants/Global_Widgets/List Tile/ssc_expanstion.dart';
import 'package:provider/provider.dart';

import '../../../StageManagementClass/provider_state_management.dart';

class StapleConversationChart extends StatefulWidget {
  const StapleConversationChart({super.key});

  @override
  State<StapleConversationChart> createState() =>
      _StapleConversationChartState();
}

class _StapleConversationChartState extends State<StapleConversationChart> {
  bool setcolor = true;

  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'stapleconvert_screen');
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    setPageName();
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
          appbarText: 'Staple Conversation Chart',
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
                    child: Text(
                      'Inches',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350.w,
                    child: Text(
                      'MM',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      '32nd',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Decimal',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.sp,
                      color: themeProvider.themeMode.name == 'Light'
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            //Expanstion List
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  //Short Staple
                  Container(
                    margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                    decoration: BoxDecoration(
                      // color: Universal_Gray,
                      // color: setcolor ? Colors.white : Colors.red,
                      border: Border.all(
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        'Short Staple',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 50.sp,
                            color: themeProvider.themeMode.name == 'Light'
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          setcolor = expanded;
                        });
                      },
                      children: [
                        Container(
                          // color: Colors.white,
                          child: const Column(
                            children: [
                              // 13by16
                              SCCExpanstionList(
                                one: '13/16"',
                                two: '20.64',
                                three: '26',
                                four: '0.81520',
                              ),

                              // 27by32
                              SCCExpanstionList(
                                one: '27/32"',
                                two: '21.43',
                                three: '27',
                                four: '0.84375',
                              ),

                              // 7by8
                              SCCExpanstionList(
                                one: '7/8"',
                                two: '22.23',
                                three: '28',
                                four: '0.87500',
                              ),

                              // 29by32
                              SCCExpanstionList(
                                one: '7/8"',
                                two: '23.02',
                                three: '29',
                                four: '0.90625',
                              ),
                              SCCExpanstionList(
                                one: '29/32"',
                                two: '23.81',
                                three: '29',
                                four: '0.93750',
                              ),
                              SCCExpanstionList(
                                one: '15/16"',
                                two: '20.64',
                                three: '26',
                                four: '0.81520',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Medium Staple
                  Container(
                    margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        'Medium Staple',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 50.sp,
                            color: themeProvider.themeMode.name == 'Light'
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          // tileColor: Colors.grey,
                          title: Container(
                            // color: Colors.white,
                            child: const Column(
                              children: [
                                // 13by16
                                SCCExpanstionList(
                                  one: '31/32"',
                                  two: '24.61',
                                  three: '31',
                                  four: '0.96875',
                                ),

                                // 27by32
                                SCCExpanstionList(
                                  one: '1"',
                                  two: '25.40',
                                  three: '32',
                                  four: '1.00000',
                                ),

                                // 7by8
                                SCCExpanstionList(
                                  one: '1.1/32"',
                                  two: '26.19',
                                  three: '33',
                                  four: '1.03125',
                                ),

                                // 29by32
                                SCCExpanstionList(
                                  one: '1.1/16"',
                                  two: '26.99',
                                  three: '34',
                                  four: '1.06250',
                                ),
                                SCCExpanstionList(
                                  one: '1.3/32"',
                                  two: '27.78',
                                  three: '35',
                                  four: '1.09375',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Medium To Long Staple
                  Container(
                    margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        'Medium To Long Staple',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 50.sp,
                            color: themeProvider.themeMode.name == 'Light'
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          // tileColor: Colors.grey,
                          title: Container(
                            // color: Colors.white,
                            child: const Column(
                              children: [
                                // 13by16
                                SCCExpanstionList(
                                  one: '1.1/8"',
                                  two: '28.58',
                                  three: '36',
                                  four: '1.12500',
                                ),

                                // 27by32
                                SCCExpanstionList(
                                  one: '1.5/32"',
                                  two: '29.37',
                                  three: '37',
                                  four: '1.18750',
                                ),

                                // 7by8
                                SCCExpanstionList(
                                  one: '1.3/16"',
                                  two: '30.16',
                                  three: '38',
                                  four: '1.18750',
                                ),

                                // 29by32
                                SCCExpanstionList(
                                  one: '1.7/32"',
                                  two: '30.96',
                                  three: '39',
                                  four: '1.21875',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Long Staple
                  Container(
                    margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white, // color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        'Long Staple',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 50.sp,
                            color: themeProvider.themeMode.name == 'Light'
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          // tileColor: Colors.grey,
                          title: Container(
                            // color: Colors.white,
                            child: const Column(
                              children: [
                                // 13by16
                                SCCExpanstionList(
                                  one: '1.1/4"',
                                  two: '31.75',
                                  three: '40',
                                  four: '1.25000',
                                ),

                                // 27by32
                                SCCExpanstionList(
                                  one: '1.9/32"',
                                  two: '32.64',
                                  three: '41',
                                  four: '1.28125',
                                ),

                                // 7by8
                                SCCExpanstionList(
                                  one: '1.5/16"',
                                  two: '33.34',
                                  three: '42',
                                  four: '1.31250',
                                ),

                                // 29by32
                                SCCExpanstionList(
                                  one: '1.11/32"',
                                  two: '34.13',
                                  three: '43',
                                  four: '1.34375',
                                ),
                                SCCExpanstionList(
                                  one: '1.3/8"',
                                  two: '34.93',
                                  three: '44',
                                  four: '1.37500',
                                ),
                                SCCExpanstionList(
                                  one: '1.1/32"',
                                  two: '35.72',
                                  three: '45',
                                  four: '1.40625',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Extra Long Staple
                  Container(
                    margin: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeProvider.themeMode.name == 'Light'
                            ? Colors.black
                            : Colors.white,
                        width: 5.sp,
                      ),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        'Extra Long Staple',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 60.sp,
                            color: themeProvider.themeMode.name == 'Light'
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      children: [
                        ListTile(
                          // tileColor: Colors.grey,
                          title: Container(
                            // color: Colors.white,
                            child: const Column(
                              children: [
                                // 13by16
                                SCCExpanstionList(
                                  one: '1.7/16"',
                                  two: '36.51',
                                  three: '46',
                                  four: '1.43750',
                                ),

                                // 27by32
                                SCCExpanstionList(
                                  one: '1.15/32"',
                                  two: '37.31',
                                  three: '47',
                                  four: '1.46875',
                                ),

                                // 7by8
                                SCCExpanstionList(
                                  one: '1.1/2"',
                                  two: '38.10',
                                  three: '48',
                                  four: '1.50000',
                                ),

                                // 29by32
                                SCCExpanstionList(
                                  one: '1.17/32"',
                                  two: '38.89',
                                  three: '49',
                                  four: '1.53125',
                                ),
                                SCCExpanstionList(
                                  one: '11.9/16"',
                                  two: '39.69',
                                  three: '50',
                                  four: '1.56250',
                                ),
                                SCCExpanstionList(
                                  one: '1.19/32"',
                                  two: '40.48',
                                  three: '51',
                                  four: '1.59375',
                                ),

                                SCCExpanstionList(
                                  one: '1.5/8"',
                                  two: '41.28',
                                  three: '52',
                                  four: '1.62500',
                                ),
                                SCCExpanstionList(
                                  one: '1.21/32"',
                                  two: '42.07',
                                  three: '53',
                                  four: '1.65625',
                                ),
                                SCCExpanstionList(
                                  one: '1.11/16"',
                                  two: '42.86',
                                  three: '54',
                                  four: '1.68750',
                                ),
                                SCCExpanstionList(
                                  one: '1.12/32"',
                                  two: '43.66',
                                  three: '55',
                                  four: '1.71875',
                                ),
                                SCCExpanstionList(
                                  one: '1.3/4"',
                                  two: '44.45',
                                  three: '56',
                                  four: '1.75000',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
