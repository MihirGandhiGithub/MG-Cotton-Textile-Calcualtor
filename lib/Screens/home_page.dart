import 'dart:async';
import 'dart:io';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/Global_Variables/Screen Util Size.dart';
import '../Constants/Global_Variables/variables/variables.dart';
import '../Constants/Global_Widgets/Appbar/appbar_with_action.dart';
import '../Other Class/auth_services.dart';
import '../StageManagementClass/provider_state_management.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../webview/webview.dart';
import 'Authentication/Login Screen/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uri whatsappUrl = Uri();
  final String linkToShare =
      'https://play.google.com/store/apps/details?id=mg.kingtechnology.in.kt1_textile_calculator&pcampaignid=web_share'; // Replace this with your desired link
  final String textToShare =
      'King Textile Calculator'; // Replace this with your desired text

  final List<String> documentid = [];

  Future<void> _launchAppUrl() async {
    const String packageName = 'mg.kingtechnology.in.kt1_textile_calculator';
    final Uri playStoreUrl = Uri.https(
        'play.google.com', '/store/apps/details', {'id': packageName});

    if (await canLaunchUrl(playStoreUrl)) {
      await launchUrl(playStoreUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }

  Future setPageName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_screen', 'home_screen');
  }

  @override
  void initState() {
    super.initState();
    // _checkUpdate();

    setPageName();
  }

  @override
  Widget build(BuildContext context) {
    // var selectedValue = Provider.of<DropdownState>(context).selectedValue;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final firebaseConfigrationInside =
        Provider.of<firebaseConfigrations>(context);
    void _showConfirmationDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Theme Change'),
            content: Text(
                'Are you sure you want to switch to ${themeProvider.themeMode.name == 'Light' ? 'Dark' : 'Light'} mode?'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  themeProvider.toggleTheme();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Textile Calculator',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu_sharp),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: themeProvider.isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator()),
                    )
                  : themeProvider.themeMode.name == 'Light'
                      ? Icon(Icons.dark_mode_outlined)
                      : Icon(Icons.dark_mode_rounded),
              // onTap: () {
              //   themeProvider.toggleTheme();
              // },
              onTap: () {
                _showConfirmationDialog(context);
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return UserAccountsDrawerHeader(
                  accountName: Text(firebaseConfigrationInside.userNameg),
                  accountEmail: Text(firebaseConfigrationInside.userEmailg),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                        firebaseConfigrationInside.userNameg[0].toUpperCase()),
                  ),
                  decoration: BoxDecoration(
                      color: themeProvider.themeMode.name == 'Light'
                          ? Colors.blue
                          : null),
                );
              },
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // ListTile(
                  //   leading: SizedBox(
                  //     width: SUwidth100w,
                  //     child: const Icon(
                  //       Icons.share,
                  //     ),
                  //   ),
                  //   title: Text('Share App'),
                  //   onTap: () {
                  //     Share.share(
                  //       '$textToShare\n$linkToShare',
                  //       subject: 'Snapshot From Textile Calculator',
                  //     );
                  //   },
                  // ),
                  // ListTile(
                  //   leading: SizedBox(
                  //     width: SUwidth100w,
                  //     child: Image.asset(
                  //       'assets/only_kt_logo.png',
                  //     ),
                  //   ),
                  //   title: Text('About Us'),
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => WebView()));
                  //   },
                  // ),
                  ListTile(
                    leading: SizedBox(
                      width: SUwidth100w,
                      child: const Icon(
                        Icons.call,
                      ),
                    ),
                    title: Text('Any Quey ? Call Us'),
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '+91 9913559449',
                      );

                      await launchUrl(launchUri);
                    },
                  ),
                  // ListTile(
                  //   leading: SizedBox(
                  //     width: SUwidth100w,
                  //     child: Image.asset(
                  //       'assets/whtasapp_logo.png',
                  //     ),
                  //   ),
                  //   title: Text('Chat On Whatsapp'),
                  //   onTap: () async {
                  //     try {
                  //       whatsappUrl =
                  //           Uri.parse("whatsapp://send?phone=+919909001037");
                  //       if (await canLaunchUrl(whatsappUrl)) {
                  //         await launchUrl(whatsappUrl,
                  //             mode: LaunchMode.externalApplication);
                  //       } else {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(
                  //             content: Text(
                  //                 "WhatsApp is not installed on your device."),
                  //           ),
                  //         );
                  //       }
                  //     } catch (e) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text(e.toString()),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
            if (!Platform.isIOS)
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: SUheight150h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      Icon(Icons.logout),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('LogOut'),
                                    ],
                                  ),
                                  content: const Text(
                                      'Are you sure Want To Logout ?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No')),
                                    TextButton(
                                        onPressed: () async {
                                          try {
                                            await firebaseConfigrationInside
                                                .signOut();
                                            Navigator.pushReplacementNamed(
                                                context, '/login_screen');
                                          } catch (error) {
                                            SnackBar snackBar = SnackBar(
                                                content: Text(
                                                    'Logout error: $error'));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: const Text('Yes'))
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: text60sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Consumer<DropdownState>(
            builder: (context, dropdownState, child) {
              if (!dropdownState.isInitialized) {
                return CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RegionDropdown(),
              );
            },
          ),
          for (int index = 0; index < ItemList.itemList.length; index++)
            CustomListTile(
              index: index,
              name: ItemList.itemList[index]['Name'],
              imageUrl: ItemList.itemList[index]['imageUrl'],
              isLiked: false,
              onPreesed: () => Navigator.of(context).pushReplacementNamed(
                  '/${ItemList.itemList[index]['navigatePage']}'),
              showLikeIcon: index != 0,
            ),
          SizedBox(
            height: SUheight50h,
          )
        ],
      ),
    );

    // print('Selected Value: $selectedValue');

    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //         'Textile Calculator',
    //         style: TextStyle(color: Colors.white),
    //       ),
    //       leading: IconButton(
    //         color: Colors.white,
    //         icon: Icon(Icons.menu_sharp),
    //         onPressed: () => Scaffold.of(context).openDrawer(),
    //       ),
    //       centerTitle: true,
    //       actions: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: GestureDetector(
    //             child: themeProvider.isLoading
    //                 ? Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: SizedBox(
    //                         height: 15,
    //                         width: 15,
    //                         child: CircularProgressIndicator()),
    //                   )
    //                 : Icon(Icons.dark_mode_outlined),
    //             onTap: () {
    //               themeProvider.toggleTheme();
    //             },
    //           ),
    //         )
    //         // themeProvider.isLoading
    //         //     ? Center(
    //         //         child: SizedBox(
    //         //             height: 10,
    //         //             width: 10,
    //         //             child: CircularProgressIndicator()),
    //         //       )
    //         //     : IconButton(
    //         //         onPressed: () {
    //         //           themeProvider.toggleTheme();
    //         //         },
    //         //         icon: Icon(Icons.dark_mode))
    //       ],
    //     ),
    //     drawer: Drawer(
    //       child: Column(
    //         children: [
    //           Consumer<ThemeProvider>(
    //             builder: (context, themeProvider, child) {
    //               return UserAccountsDrawerHeader(
    //                 accountName: Text(firebaseConfigrationInside.userNameg),
    //                 accountEmail: Text(firebaseConfigrationInside.userEmailg),
    //                 currentAccountPicture: CircleAvatar(
    //                   child: Text(firebaseConfigrationInside.userNameg[0]
    //                       .toUpperCase()),
    //                 ),
    //                 decoration: BoxDecoration(
    //                     color: themeProvider.themeMode.name == 'Light'
    //                         ? Colors.blue
    //                         : null),
    //               );
    //             },
    //           ),
    //           Expanded(
    //             child: ListView(
    //               padding: EdgeInsets.zero,
    //               children: [
    //                 // Card(
    //                 //   elevation: 5,
    //                 //   child: ListTile(
    //                 //     // tileColor: Colors.white,
    //                 //     leading: SizedBox(
    //                 //       width: SUwidth100w,
    //                 //       child: const Icon(
    //                 //         Icons.person,
    //                 //         // color: Colors.black,
    //                 //       ),
    //                 //     ),
    //                 //     title: Text('Edit Profile'),
    //                 //     onTap: () {
    //                 //       Navigator.of(context).pushNamed('/AddDetail_screen');
    //                 //     },
    //                 //   ),
    //                 // ),
    //                 ListTile(
    //                   // tileColor: Colors.white,
    //                   leading: SizedBox(
    //                     width: SUwidth100w,
    //                     child: const Icon(
    //                       Icons.share,
    //                       // color: Colors.blue,
    //                     ),
    //                   ),
    //                   title: Text('Share App'),
    //                   onTap: () {
    //                     Share.share(
    //                       '$textToShare\n$linkToShare',
    //                       subject:
    //                           'Snapshot From Textile Calculator', // Subject is optional
    //                     );
    //                   },
    //                 ),
    //                 ListTile(
    //                   // tileColor: Colors.white,
    //                   leading: SizedBox(
    //                     width: SUwidth100w,
    //                     child: Image.asset(
    //                       'assets/only_kt_logo.png',
    //                     ),
    //                   ),
    //                   title: Text('About Us'),
    //                   onTap: () {
    //                     Navigator.push(context,
    //                         MaterialPageRoute(builder: (context) => WebView()));
    //                   },
    //                 ),
    //                 ListTile(
    //                   // tileColor: Colors.white,
    //                   leading: SizedBox(
    //                     width: SUwidth100w,
    //                     child: const Icon(
    //                       Icons.call,
    //                       // color: Colors.black,
    //                     ),
    //                   ),
    //                   title: Text('Any Quey ? Call Us'),
    //                   onTap: () async {
    //                     final Uri launchUri = Uri(
    //                       scheme: 'tel',
    //                       path: '+91 9909001037',
    //                     );
    //
    //                     await launchUrl(launchUri);
    //                   },
    //                 ),
    //                 ListTile(
    //                   // tileColor: Colors.white,
    //                   leading: SizedBox(
    //                     width: SUwidth100w,
    //                     child: Image.asset(
    //                       'assets/whtasapp_logo.png',
    //                     ),
    //                   ),
    //                   title: Text('Chat On Whatsapp'),
    //                   onTap: () async {
    //                     try {
    //                       whatsappUrl =
    //                           Uri.parse("whatsapp://send?phone=+919909001037");
    //                       if (await canLaunchUrl(whatsappUrl)) {
    //                         await launchUrl(whatsappUrl,
    //                             mode: LaunchMode.externalApplication);
    //                         // _phoneController.clear();
    //                       } else {
    //                         // WhatsApp is not installed on the user's device
    //                         ScaffoldMessenger.of(context).showSnackBar(
    //                           const SnackBar(
    //                             content: Text(
    //                                 "WhatsApp is not installed on your device."),
    //                           ),
    //                         );
    //                       }
    //                     } catch (e) {
    //                       ScaffoldMessenger.of(context).showSnackBar(
    //                         SnackBar(
    //                           content: Text(e.toString()),
    //                         ),
    //                       );
    //                     }
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Align(
    //             alignment: Alignment.bottomCenter,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 // Logout
    //                 SizedBox(
    //                   height: SUheight150h,
    //                   child: ElevatedButton(
    //                     style: ElevatedButton.styleFrom(
    //                       // backgroundColor: Colors.blue,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(0),
    //                       ),
    //                     ),
    //                     onPressed: () async {
    //                       await showDialog(
    //                           context: context,
    //                           builder: (context) {
    //                             return AlertDialog(
    //                               title: Row(
    //                                 children: [
    //                                   Icon(Icons.logout),
    //                                   SizedBox(
    //                                     width: 5,
    //                                   ),
    //                                   Text('LogOut'),
    //                                 ],
    //                               ),
    //                               content: const Text(
    //                                   'Are you sure Want To Logout ?'),
    //                               actions: [
    //                                 TextButton(
    //                                     onPressed: () {
    //                                       Navigator.of(context).pop();
    //                                     },
    //                                     child: const Text('No')),
    //                                 TextButton(
    //                                     onPressed: () async {
    //                                       try {
    //                                         await firebaseConfigrationInside
    //                                             .signOut();
    //                                         Navigator.pushReplacementNamed(
    //                                             context, '/login_screen');
    //                                       } catch (error) {
    //                                         SnackBar snackBar = SnackBar(
    //                                             content: Text(
    //                                                 'Logout error: $error'));
    //                                         ScaffoldMessenger.of(context)
    //                                             .showSnackBar(snackBar);
    //                                       }
    //                                     },
    //                                     child: const Text('Yes'))
    //                               ],
    //                             );
    //                           });
    //                     },
    //                     child: Text(
    //                       'Logout',
    //                       style: TextStyle(
    //                         fontSize: text60sp,
    //
    //                         // color: Colors.white
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: ListView(
    //       children: [
    //         Consumer<DropdownState>(
    //           builder: (context, dropdownState, child) {
    //             if (!dropdownState.isInitialized) {
    //               return CircularProgressIndicator();
    //             }
    //             return Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: RegionDropdown(),
    //             );
    //           },
    //         ),
    //         for (int index = 0; index < ItemList.itemList.length; index++)
    //           CustomListTile(
    //             // Pass the adjusted index to CustomListTile
    //             index: index,
    //             name: ItemList.itemList[index]['Name'],
    //             imageUrl: ItemList.itemList[index]['imageUrl'],
    //             isLiked: false,
    //             onPreesed: () => Navigator.of(context).pushReplacementNamed(
    //                 '/${ItemList.itemList[index]['navigatePage']}'),
    //             showLikeIcon: index != 0,
    //           ),
    //         SizedBox(
    //           height: SUheight50h,
    //         )
    //       ],
    //     ));
  }
}

class CustomListTile extends StatelessWidget {
  final int index; // Add index parameter
  final Function() onPreesed;
  final String name;
  final String imageUrl;
  final bool isLiked;

  final bool showLikeIcon;

  CustomListTile({
    required this.index, // Accept index parameter
    required this.name,
    required this.imageUrl,
    required this.isLiked,
    required this.onPreesed,
    required this.showLikeIcon,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: themeProvider.themeMode.name == 'Light'
                ? Colors.blue.shade300
                : Colors.white,
            width: 0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onTap: onPreesed,
        contentPadding: const EdgeInsets.all(10),

        // tileColor: Colors.white,
        leading: SizedBox(
          height: 50,
          width: 60,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imageUrl),
              ),
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class RegionDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dropdownState = Provider.of<DropdownState>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    final List<String> confirmationMessages = [
      'Do you want to select "All in one"?',

      // 'Do you want to select "Andhra Pradesh"?',
      'Select Andhra Pradesh ?\nKapas & Cotton-Seed in ₹/Quintal,\nExpenses in ₹/Candy.',

      // 'Do you want to select "Gujarat"?',
      'Select Gujarat ?\nKapas & Cotton-Seed & Expenses in ₹/20 Kgs.',

      // 'Do you want to select "Karnataka"?',
      'Select Karnataka ?\nKapas & Cotton-Seed in ₹/Quintal,\nExpenses in ₹/Candy.',

      // 'Do you want to select "Lower Rajasthan"?',
      'Select Lower Rajasthan ?\nKapas & Cotton-Seed & Expenses in ₹/Quintal,\nPercentage & Result in ₹/Candy.',

      // 'Do you want to select "Madhya Pradesh"?',
      'Select Madhya Pradesh ?\nKapas & Cotton Seed ₹/Quintal,\nShortage on Cotton-Seed & Expenses in ₹/Candy.',

      // 'Do you want to select "Maharashtra"?',
      'Select Maharashtra ?\nKapas & Cotton-Seed & Expenses in ₹/Quintal.',

      // 'Do you want to select "North Zone"?',
      'Select North Zone ?\nKapas & Cotton-Seed & Expenses in ₹/Quintal,\nPercentage & Result in ₹/Maund.',

      // 'Do you want to select "Telangana"?',
      'Select Telangana ?\nKapas & Cotton-Seed in ₹/Quintal,\nExpenses in ₹/Candy.',
    ];

    Future<void> _showConfirmationDialog(
        BuildContext context, int index, String newValue) async {
      bool? confirmed = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Change'),
            content: Text(confirmationMessages[index]),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Confirm'),
              ),
            ],
          );
        },
      );

      if (confirmed == true) {
        dropdownState.updateValue(newValue);
      }
    }

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.expand_circle_down,
            color: themeProvider.themeMode.name == 'Light'
                ? Colors.blue
                : Colors.white,
          ),
        ),
        enableFeedback: true,
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          height: 50,
          elevation: 15,
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: themeProvider.themeMode.name == 'Light'
                  ? Colors.blue
                  : Colors.white,
            ),
          ),
        ),
        value: dropdownState.selectedValue,
        onChanged: (String? newValue) {
          if (newValue != null) {
            int selectedIndex = <String>[
              'All in one',
              'Andhra Pradesh',
              'Gujarat',
              'Karnataka',
              'Lower Rajasthan',
              'Madhya Pradesh',
              'Maharashtra',
              'North Zone',
              'Telangana',
            ].indexOf(newValue);

            _showConfirmationDialog(context, selectedIndex, newValue);
          }
        },
        items: <String>[
          'All in one',
          'Andhra Pradesh',
          'Gujarat',
          'Karnataka',
          'Lower Rajasthan',
          'Madhya Pradesh',
          'Maharashtra',
          'North Zone',
          'Telangana',
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        isDense: true,
      ),
    );
  }
}

// class MyDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text("AppMaking.co"),
//             accountEmail: Text("sundar@appmaking.co"),
//             currentAccountPicture: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
//             ),
//             decoration: BoxDecoration(
//                 // color: Colors.blue,
//                 ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 ListTile(
//                   leading: Icon(
//                     Icons.share,
//                     // color: Colors.blue,
//                   ),
//                   title: Text('Share App'),
//                   onTap: () {
//                     // Implement share functionality
//                   },
//                 ),
//                 ListTile(
//                   leading: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset('assets/only_kt_logo.png'),
//                   ),
//                   title: Text('About Us'),
//                   onTap: () {
//                     // Implement navigation to About Us page
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.call,
//                     // color: Colors.black,
//                   ),
//                   title: Text('Any Query? Call Us'),
//                   onTap: () async {
//                     final Uri launchUri = Uri(
//                       scheme: 'tel',
//                       path: '+91 9909001037',
//                     );
//                     // await launchUrl(launchUri); // Uncomment to use launchUrl
//                   },
//                 ),
//                 ListTile(
//                   leading: SizedBox(
//                     height: 50.0, // Adjust the height accordingly
//                     child: Image.asset('assets/whtasapp_logo.png'),
//                   ),
//                   title: Text('Chat On Whatsapp'),
//                   onTap: () async {
//                     // Implement WhatsApp chat functionality
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(
//                   height: 50.0, // Adjust the height accordingly
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       // backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'Logout',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         // color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
