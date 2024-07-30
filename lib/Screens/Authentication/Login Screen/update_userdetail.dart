// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../Constants/Global_Variables/Screen Util Size.dart';
// import '../../../Constants/Global_Variables/Sizes/global_sizes.dart';
//
// import '../../../Constants/Global_Widgets/TextFormField/custom_text_form_field.dart';
// import '../../../Other Class/auth_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:intl_phone_field/intl_phone_field.dart';
//
// class AddDetailPage extends StatefulWidget {
//   final User user;
//
//   const AddDetailPage({required this.user});
//
//   @override
//   State<AddDetailPage> createState() => _AddDetailPageState();
// }
//
// class _AddDetailPageState extends State<AddDetailPage> {
//   String? _nameError;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _contactNumber = TextEditingController();
//
//   String CountryName = 'India';
//
//   bool isLoading = false;
//   Future<void> updateUserData(String newName, String contactNumber) async {
//     // try {
//     //   setState(() {
//     //     isLoading = true;
//     //   });
//     //
//     //   DocumentReference userRef = CustomAuthService.firestore
//     //       .collection('users')
//     //       .doc(CustomAuthService.user!.uid);
//     //
//     //   await userRef.update({'name': newName, 'PhoneNumber': contactNumber});
//     //   setState(() {
//     //     CustomAuthService.userName = newName;
//     //     CustomAuthService.userPhoneNumber = contactNumber;
//     //   });
//     //
//     //   Future.delayed(const Duration(milliseconds: 200), () {
//     //     Navigator.pushReplacementNamed(context, '/home_screen');
//     //   });
//     // } catch (e) {
//     //   setState(() {
//     //     isLoading = false;
//     //   });
//     //   SnackBar snackBar =
//     //       SnackBar(content: Text('Error Connecting DataBase: $e'));
//     //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     //   // TODO
//     // }
//   }
//
//   // Future<void> loadDaata() async {
//   //   CustomAuthService.userSnapshot = await CustomAuthService.firestore
//   //       .collection('users')
//   //       .doc(CustomAuthService.user!.uid)
//   //       .get();
//   //
//   //   setState(() {
//   //     CustomAuthService.userName =
//   //         CustomAuthService.userSnapshot!['name'].toString();
//   //     CustomAuthService.userEmail =
//   //         CustomAuthService.userSnapshot!['email'].toString();
//   //     CustomAuthService.userPhoneNumber =
//   //         CustomAuthService.userSnapshot!['PhoneNumber'].toString();
//   //   });
//   // }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     // loadDaata();
//
//     // _nameController.text = CustomAuthService.userName;
//     // _emailController.text = CustomAuthService.userEmail;
//     // _contactNumber.text = CustomAuthService.userPhoneNumber;
//     print('\n \n \n \n');
//     // print(CustomAuthService.userName);
//     print('\n \n \n \n');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Stack(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 2,
//             color: Colors.white,
//           ),
//           Center(
//               child: SingleChildScrollView(
//             child: Container(
//               width: SUwidth1350w,
//               height: SUheight1500h,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: const [
//                     BoxShadow(
//                         blurRadius: 5,
//                         offset: Offset(0, 0),
//                         color: Colors.black)
//                   ]),
//               alignment: Alignment.center,
//               padding: EdgeInsets.only(
//                   top: 10.h, bottom: 20.h, left: 50.w, right: 50.w),
//               // margin: EdgeInsets.only(
//               //     left: 50.w, right: 50.w, top: 150.h, bottom: 0.h),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   SizedBox(
//                     height: 400.h,
//                     child: Image.asset('assets/textile_calculator_logo.png'),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 50.h),
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Edit Detail',
//                       style: TextStyle(color: Colors.black, fontSize: 80.sp),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(bottom: 20.h, top: 10.h),
//                     alignment: Alignment.center,
//                     child: Text(
//                       _emailController.text,
//                       style: TextStyle(color: Colors.black, fontSize: 80.sp),
//                     ),
//                   ),
//                   //Name
//                   CustomTextFormField(
//                     controller: _nameController,
//                     errorText: _nameError,
//                     onChanged: (value) {
//                       setState(() {
//                         if (value.isEmpty) {
//                           _nameError = 'Name is required';
//                         } else {
//                           _nameError = null;
//                         }
//                       });
//                     },
//                     icon: const Icon(Icons.person),
//                     labelText: 'Name',
//                     isLastField: false,
//                     obscureText: false,
//                     numberKeyboard: false,
//                     enabled: true,
//                   ),
//
//                   IntlPhoneField(
//                     keyboardType: TextInputType.number,
//                     // disableLengthCheck: true,
//                     controller: _contactNumber,
//
//                     initialCountryCode: 'IN',
//                     // focusNode: focusNode,
//                     decoration: InputDecoration(
//                       hintText: 'Enter Phone Number (Optional)',
//                       hintStyle: TextStyle(fontSize: text50sp),
//
//                       // hintText: 'Enter Phone Number',
//                       filled: true,
//                       fillColor: Colors.white10,
//                       border: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(textFormFieldBorderRadius),
//                       ),
//                       // Pass the errorText directly
//
//                       errorMaxLines: 1,
//                       errorBorder: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(color: Colors.red, width: 2.0),
//                         borderRadius: BorderRadius.circular(
//                             textFormFieldErrorBorderRadius),
//                       ),
//                     ),
//                     languageCode: "en",
//                     onChanged: (value) {
//                       // print(value.completeNumber);
//                     },
//                     onCountryChanged: (country) {
//                       // setState(() {
//                       //   CountryName = country.name;
//                       // });
//                       print('Country changed to: \n \n \n \n' + country.name);
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   //Contact No
//
//                   Padding(
//                     padding:
//                         EdgeInsets.only(left: 200.w, right: 200.w, top: 40.h),
//                     child: isLoading
//                         ? const Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.blue,
//                             ),
//                           )
//                         : ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               // backgroundColor: const Color.fromRGBO(23, 35, 255, 1.0),
//                               // shape: RoundedRectangleBorder(
//                               //   borderRadius: BorderRadius.circular(50.sp),
//                               // ),
//                             ),
//                             onPressed: () {
//                               bool alltrue = _nameError == null &&
//                                   _nameController.text.isNotEmpty;
//                               if (alltrue) {
//                                 updateUserData(
//                                   _nameController.text,
//                                   _contactNumber.text,
//                                 );
//
//                                 // print('Registering user...');
//                                 // Continue with the registration process
//                               } else {
//                                 if (_nameController.text.isEmpty ||
//                                     _nameError != null) {
//                                   setState(() {
//                                     _nameError = 'Please Enter Name';
//                                   });
//                                 }
//                               }
//                             },
//                             child: Text(
//                               'Update',
//                               style: TextStyle(
//                                   // fontSize: 60.sp,
//                                   color: Colors.white),
//                             ),
//                           ),
//                   )
//                 ],
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
