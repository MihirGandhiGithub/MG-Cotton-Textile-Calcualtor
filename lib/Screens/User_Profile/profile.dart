// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kt1_textile_calculator/Constants/Global_Widgets/Appbar/appbar_with_text.dart';
// import 'package:kt1_textile_calculator/Constants/Global_Widgets/Text/CustomText.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../Constants/Global_Variables/variables/variables.dart';
// import '../../Constants/Global_Widgets/TextFormField/custom_text_form_field.dart';
// import '../../Other Class/auth_services.dart';
// import '../../select region.dart';
// import '../../webview/webview.dart';
// import '../Authentication/Login Screen/login_page.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _contactNumber = TextEditingController();
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   //Loader State
//   bool _loading = false;
//
//   String? _contactError;
//   String? _nameError;
//
//   Future<void> updateUserData(String newName, String contactNumber) async {
//     User? user = _auth.currentUser;
//     DocumentReference userRef = _firestore.collection('users').doc(user!.uid);
//
//     await userRef.update({'name': newName, 'contactNumber': contactNumber});
//
//     setState(() {
//       CustomAuthService.userName = newName;
//       CustomAuthService.userPhoneNumber = contactNumber;
//       edit = false;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _nameController.text = CustomAuthService.userName;
//     _emailController.text = CustomAuthService.userEmail;
//     _contactNumber.text = CustomAuthService.userPhoneNumber;
//   }
//
//   bool edit = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: const AppbarWithText(
//         appbarText: 'Settings',
//         centerTitle: false,
//         isBackButton: false,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => DropdownButtonExample()));
//                 },
//                 child: Text('seelction')),
//           ),
//           Expanded(
//             child: ListView(
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 //Calculator Logo
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     height: 450.h,
//                     child: Image.asset('assets/textile_calculator_logo.png'),
//                   ),
//                 ),
//
//                 //Edit Switch
//                 Container(
//                   margin: EdgeInsets.only(left: 50.w, right: 50.w, top: 50.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Edit Profile',
//                         style: TextStyle(color: Colors.black, fontSize: 70.sp),
//                       ),
//                       SizedBox(
//                         height: 120.h,
//                         child: edit
//                             ? ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.red,
//                                     foregroundColor: Colors.white),
//                                 onPressed: () {
//                                   setState(() {
//                                     edit = !edit;
//                                   });
//                                 },
//                                 child: const Text('Cancel'))
//                             : ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.blue,
//                                     foregroundColor: Colors.white),
//                                 onPressed: () {
//                                   setState(() {
//                                     edit = !edit;
//                                   });
//                                 },
//                                 icon: const Icon(Icons.edit_calendar_outlined),
//                                 label: const Text('Edit')),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // user Data
//                 Container(
//                   margin: EdgeInsets.only(
//                       left: 20.w, right: 20.w, top: 50.h, bottom: 50.h),
//                   child: Column(
//                     children: [
//                       //Name
//                       CustomTextFormField(
//                         controller: _nameController,
//                         errorText: _nameError,
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isEmpty) {
//                               _nameError = 'Name is required';
//                             } else {
//                               _nameError = null;
//                             }
//                           });
//                         },
//                         icon: const Icon(Icons.person),
//                         labelText: 'Name',
//                         isLastField: false,
//                         obscureText: false,
//                         numberKeyboard: false,
//                         enabled: edit,
//                       ),
//
//                       //Email
//                       edit
//                           ? const SizedBox()
//                           : CustomTextFormField(
//                               controller: _emailController,
//                               errorText: null,
//                               onChanged: (value) {},
//                               icon: const Icon(Icons.email),
//                               labelText: 'E-mail ID',
//                               isLastField: false,
//                               obscureText: false,
//                               numberKeyboard: false,
//                               enabled: false,
//                             ),
//
//                       //Contact No
//                       CustomTextFormField(
//                         controller: _contactNumber,
//                         errorText: _contactError,
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isEmpty) {
//                               _contactError = 'Contact is required';
//                             } else if (!ValidationScripts.contactNumber
//                                 .hasMatch(value)) {
//                               _contactError = 'Invalid Number format';
//                             } else {
//                               _contactError = null;
//                             }
//                           });
//                         },
//                         icon: const Icon(Icons.quick_contacts_dialer_outlined),
//                         labelText: 'Contact No.',
//                         isLastField: true,
//                         obscureText: false,
//                         numberKeyboard: true,
//                         enabled: edit,
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 edit
//                     ? Container(
//                         margin: EdgeInsets.only(
//                             left: 100.w, right: 100.w, bottom: 50.h),
//                         height: 150.h,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(70.sp),
//                             ),
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               _loading = true;
//                             });
//                             try {
//                               if (_nameError == null &&
//                                   _nameController.text.isNotEmpty &&
//                                   _contactError == null &&
//                                   _contactNumber.text.isNotEmpty) {
//                                 // Proceed with registration since there are no errors in any field
//                                 // Add your registration logic here
//                                 await updateUserData(
//                                     _nameController.text, _contactNumber.text);
//                               } else {
//                                 if (_contactNumber.text.isEmpty ||
//                                     _contactError != null) {
//                                   setState(() {
//                                     _contactError =
//                                         'Please Enter Contact Number';
//                                   });
//                                 } else if (_nameController.text.isEmpty ||
//                                     _nameError != null) {
//                                   setState(() {
//                                     _nameError = 'Please Enter Name';
//                                   });
//                                 }
//                               }
//                             } catch (error) {
//                               rethrow;
//                             } finally {
//                               setState(() {
//                                 _loading = false;
//                               });
//                             }
//                           },
//                           child: _loading
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                               : Text(
//                                   'Update Data',
//                                   style: TextStyle(
//                                       fontSize: 50.sp, color: Colors.white),
//                                 ),
//                         ),
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
