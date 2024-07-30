// import 'dart:async';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'package:kt1_textile_calculator/Screens/Sub%20Screens/3%20Exports_Calculation/compare_export.dart';
// import 'package:new_version_plus/new_version_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../Advertise/advetise_marque.dart';
// import '../../Constants/Global_Variables/variables/variables.dart';
// import '../../Constants/Global_Widgets/Appbar/appbar_with_action.dart';
// import '../../Constants/Global_Widgets/Text/CustomText.dart';
// import '../../StageManagementClass/provider_state_management.dart';
// import 'package:provider/provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   //Check Application New Version Is Avalible Or Not
//   // NewVersionPlus newVersion = NewVersionPlus();
//   bool isImageLoading = false;
//   //For Image Slider (Advertise Slider)
//   int _currentImageIndex = 0;
//   final List<String> imageList = [];
//   final List<String> documentid = [];
//
// // Load image URLs from Firestore
// //   Future<void> _loadImageUrlsFromFirestore() async {
// //     try {
// //       final QuerySnapshot snapshot =
// //           await FirebaseFirestore.instance.collection('advertise link').get();
// //
// //       // Use a Map to temporarily store the data
// //       final Map<int, String> tempImageMap = {};
// //       final Map<int, String> tempDocumentIdMap = {};
// //
// //       for (final doc in snapshot.docs) {
// //         final uid = doc.id;
// //         final index = doc['index'];
// //         final link = doc['advertise_link'];
// //         final int? indexInt = int.tryParse(index);
// //
// //         if (indexInt != null && indexInt >= 0) {
// //           setState(() {
// //             tempImageMap[indexInt] = link;
// //             tempDocumentIdMap[indexInt] = uid;
// //           });
// //         }
// //       }
// //
// //       // Clear the existing lists and add the data from the maps
// //       // imageList.clear();
// //       // documentid.clear();
// //       imageList.addAll(List.generate(
// //           tempImageMap.length, (index) => tempImageMap[index] ?? ''));
// //       documentid.addAll(List.generate(
// //           tempDocumentIdMap.length, (index) => tempDocumentIdMap[index] ?? ''));
// //     } catch (e) {
// //       // Handle any errors that may occur during the fetch process
// //       // print('Error fetching image URLs: $e');
// //     }
// //   }
//
//   final CarouselController _controller = CarouselController();
//
//   // Future<void> _checkUpdate() async {
//   //   final VersionStatus? versionStatus = await newVersion.getVersionStatus();
//   //   if (versionStatus!.canUpdate) {
//   //     showDialog(
//   //       context: context,
//   //       barrierDismissible: false,
//   //       builder: (BuildContext context) {
//   //         return WillPopScope(
//   //           onWillPop: () async => false,
//   //           child: AlertDialog(
//   //             title: const CustomText(
//   //               text: 'New Update Available',
//   //               color: Colors.black,
//   //               maxLine: 1,
//   //               bold: false,
//   //             ),
//   //             content: const CustomText(
//   //               text:
//   //                   'A new version of the app is available. Please update to the latest version.',
//   //               color: Colors.black,
//   //               maxLine: 2,
//   //               bold: false,
//   //             ),
//   //             actions: [
//   //               ElevatedButton(
//   //                 child: const CustomText(
//   //                   text: 'Update',
//   //                   color: Colors.black,
//   //                   maxLine: 1,
//   //                   bold: false,
//   //                 ),
//   //                 onPressed: () {
//   //                   // Launch the Play Store URL to open the app page
//   //                   _launchAppUrl();
//   //                 },
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       },
//   //     );
//   //   }
//   // }
//
//   Future<void> _launchAppUrl() async {
//     const String packageName = 'mg.kingtechnology.in.kt1_textile_calculator';
//     final Uri playStoreUrl = Uri.https(
//         'play.google.com', '/store/apps/details', {'id': packageName});
//
//     if (await canLaunchUrl(playStoreUrl)) {
//       await launchUrl(playStoreUrl, mode: LaunchMode.externalApplication);
//     } else {
//       throw 'Could not launch $playStoreUrl';
//     }
//   }
//
//   void onPageChangedCallback(int index, CarouselPageChangedReason reason) {
//     setState(() {
//       _currentImageIndex = index;
//     });
//   }
//
//   Future setPageName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     //Check the update of application from playstore
//     // _checkUpdate();
//     // Call the method to load image URLs from Firestore
//     // _loadImageUrlsFromFirestore();
//     setPageName();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var dropdownState = Provider.of<DropdownState>(context);
//     var selectedValue = Provider.of<DropdownState>(context).selectedValue;
//
//     print('Selected Value: $selectedValue');
//
//     return Scaffold(
//         appBar: AppbarWithAction(
//           appbarText: 'Textile Calculator',
//           appbarIcon: Icons.dark_mode_outlined,
//           appbarIconOnPress: () =>
//               Navigator.of(context).pushNamed('/profile_screen'),
//           centerTitle: true,
//         ),
//         drawer: Drawer(
//           // backgroundColor: Colors.grey.shade400,
//           child: Column(
//             children: [
//               UserAccountsDrawerHeader(
//                 accountName: Text("Mihir Gandhi"),
//                 accountEmail: Text("gmihir11@gmail.com"),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
//                 ),
//                 decoration: BoxDecoration(color: Colors.blue
//                   // image: DecorationImage(
//                   //   image:
//                   //       AssetImage('assets/textile_calculator_logo.png'),
//                   //   fit: BoxFit.fill,
//                   // ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   children: [
//                     Card(
//                       child: ListTile(
//                         tileColor: Colors.white,
//                         leading: SizedBox(
//                           width: SUwidth100w,
//                           child: const Icon(
//                             Icons.share,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         title: Text('Share App'),
//                         onTap: () {
//                           // Share.share(
//                           //   '$textToShare\n$linkToShare',
//                           //   subject:
//                           //   'Snapshot From Textile Calculator', // Subject is optional
//                           // );
//                         },
//                       ),
//                     ),
//                     Card(
//                       child: ListTile(
//                         tileColor: Colors.white,
//                         leading: SizedBox(
//                           width: SUwidth100w,
//                           child: Image.asset(
//                             'assets/only_kt_logo.png',
//                           ),
//                         ),
//                         title: Text('About Us'),
//                         onTap: () {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => WebView(
//                           //           name: _nameController.text,
//                           //           email: _emailController.text,
//                           //           contact: _contactNumber.text,
//                           //         )));
//                         },
//                       ),
//                     ),
//                     Card(
//                       child: ListTile(
//                         tileColor: Colors.white,
//                         leading: SizedBox(
//                           width: SUwidth100w,
//                           child: const Icon(
//                             Icons.call,
//                             color: Colors.black,
//                           ),
//                         ),
//                         title: Text('Any Quey ? Call Us'),
//                         onTap: () async {
//                           final Uri launchUri = Uri(
//                             scheme: 'tel',
//                             path: '+91 9909001037',
//                           );
//
//                           await launchUrl(launchUri);
//                         },
//                       ),
//                     ),
//                     Card(
//                       child: ListTile(
//                         tileColor: Colors.white,
//                         leading: SizedBox(
//                           width: SUwidth100w,
//                           child: Image.asset(
//                             'assets/whtasapp_logo.png',
//                           ),
//                         ),
//                         title: Text('Chat On Whatsapp'),
//                         onTap: () async {
//                           // try {
//                           //   whatsappUrl =
//                           //       Uri.parse("whatsapp://send?phone=+919909001037");
//                           //   if (await canLaunchUrl(whatsappUrl)) {
//                           //     await launchUrl(whatsappUrl,
//                           //         mode: LaunchMode.externalApplication);
//                           //     // _phoneController.clear();
//                           //   } else {
//                           //     // WhatsApp is not installed on the user's device
//                           //     ScaffoldMessenger.of(context).showSnackBar(
//                           //       const SnackBar(
//                           //         content: Text(
//                           //             "WhatsApp is not installed on your device."),
//                           //       ),
//                           //     );
//                           //   }
//                           // } catch (e) {
//                           //   ScaffoldMessenger.of(context).showSnackBar(
//                           //     SnackBar(
//                           //       content: Text(e.toString()),
//                           //     ),
//                           //   );
//                           //   if (kDebugMode) {
//                           //     print("Error from launcher ${e.toString()}");
//                           //   }
//                           // }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Logout
//                     SizedBox(
//                       height: SUheight150h,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(0),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           'Logout',
//                           style: TextStyle(
//                               fontSize: text60sp, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: ListView(
//           children: [
//             Consumer<DropdownState>(
//               builder: (context, dropdownState, child) {
//                 if (!dropdownState.isInitialized) {
//                   return CircularProgressIndicator();
//                 }
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     MyDropdown(),
//                     SizedBox(height: 20),
//                     Text(
//                       'Selected Value: $selectedValue',
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 );
//               },
//             ),
//             for (int index = 0; index < ItemList.itemList.length; index++)
//               CustomListTile(
//                 // Pass the adjusted index to CustomListTile
//                 index: index,
//                 name: ItemList.itemList[index]['Name'],
//                 imageUrl: ItemList.itemList[index]['imageUrl'],
//                 isLiked: false,
//                 onPreesed: () => Navigator.of(context).pushReplacementNamed(
//                     '/${ItemList.itemList[index]['navigatePage']}'),
//                 showLikeIcon: index != 0,
//               ),
//             SizedBox(
//               height: SUheight50h,
//             )
//           ],
//         ));
//   }
// }
//
// class CustomListTile extends StatelessWidget {
//   final int index; // Add index parameter
//   final Function() onPreesed;
//   final String name;
//   final String imageUrl;
//   final bool isLiked;
//
//   final bool showLikeIcon;
//
//   CustomListTile({
//     required this.index, // Accept index parameter
//     required this.name,
//     required this.imageUrl,
//     required this.isLiked,
//     required this.onPreesed,
//     required this.showLikeIcon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         onTap: onPreesed,
//         contentPadding: const EdgeInsets.all(10),
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(color: Colors.blue, width: 0.4),
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         tileColor: Colors.white,
//         leading: SizedBox(
//           height: 50,
//           width: 60,
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage(imageUrl),
//               ),
//             ),
//           ),
//         ),
//         title: Text(
//           name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
//
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
//               color: Colors.blue,
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 ListTile(
//                   leading: Icon(
//                     Icons.share,
//                     color: Colors.blue,
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
//                     color: Colors.black,
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
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'Logout',
//                       style: TextStyle(fontSize: 20.0, color: Colors.white),
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
//
// class MyDropdown extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var dropdownState = Provider.of<DropdownState>(context);
//
//     return DropdownButton<String>(
//       value: dropdownState.selectedValue,
//       onChanged: (String? newValue) {
//         if (newValue != null) {
//           dropdownState.updateValue(newValue);
//         }
//       },
//       items: <String>[
//         'All in one',
//         'Andhra Pradesh',
//         'Gujarat',
//         'Karnataka',
//         'Lower Rajasthan',
//         'Madhya Pradesh',
//         'Maharashtra',
//         'North Zone',
//         'Telangana'
//       ].map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
