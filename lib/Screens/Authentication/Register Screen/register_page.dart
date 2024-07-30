// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../Constants/Global_Variables/Screen Util Size.dart';
// import '../../../Constants/Global_Variables/variables/variables.dart';
// import '../../../Constants/Global_Widgets/Text/CustomText.dart';
// import '../../../Constants/Global_Widgets/Text/CustomTextWithSize.dart';
// import '../../../Constants/Global_Widgets/TextFormField/custom_text_form_field.dart';
// import '../../../Other Class/auth_services.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _contactController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;
//   String? _nameError;
//   String? _emailError;
//   String? _numberError;
//   String? _passwordError;
//
//   bool isLoading = false;
//
//   //register to firebase with custom fields
//   Future<void> registerUser() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       final String name = _nameController.text.trim();
//       final String email = _emailController.text.trim();
//       final String contactNumber = _contactController.text.trim();
//       final String password = _passwordController.text;
//
//       // Check if the user already exists in Firestore
//       final QuerySnapshot existingUsers = await _firestore
//           .collection('users')
//           .where('email', isEqualTo: email)
//           .get();
//
//       if (existingUsers.docs.isNotEmpty) {
//         // User already exists, load their data from Firestore
//         final DocumentSnapshot userSnapshot = existingUsers.docs.first;
//         final Map<String, dynamic>? userData =
//             userSnapshot.data() as Map<String, dynamic>?;
//
//         if (userData != null) {
//           // Load the user's data into the respective fields
//           _nameController.text = userData['name'];
//           _contactController.text = userData['contactNumber'];
//         }
//
//         // Display a message indicating that the user already exists
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const CustomText(
//                 text: 'User Already Exists',
//                 color: Colors.black,
//                 maxLine: 1,
//                 bold: false,
//               ),
//               content: CustomText(
//                 text: 'User with email $email already exists.',
//                 color: Colors.black,
//                 maxLine: 1,
//                 bold: false,
//               ),
//               actions: [
//                 TextButton(
//                   child: const Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         // Create the user with email and password
//         final UserCredential userCredential =
//             await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//
//         // Get the user ID
//         final String userId = userCredential.user!.uid;
//
//         // Store additional user details in Firestore
//         await _firestore.collection('users').doc(userId).set({
//           'name': name,
//           'email': email,
//           'contactNumber': contactNumber,
//           'timestmap': FieldValue.serverTimestamp(),
//         });
//         setState(() {
//           UserData.userName = name;
//           UserData.userEmail = email;
//           UserData.userPhoneNumber = contactNumber;
//         });
//
//         Navigator.pushReplacementNamed(context, '/home_screen');
//       }
//     } catch (error) {
//       // Registration failed, handle the error (e.g., display an error message)
//
//       SnackBar snackBar = SnackBar(content: Text('Registration error: $error'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent, // transparent status bar
//       statusBarIconBrightness: Brightness.dark, // dark text for status bar
//       systemNavigationBarColor:
//           Colors.blue, // background color of the navigation bar
//     ));
//     void registerButtonPressed() {
//       if (_nameError == null &&
//           _emailError == null &&
//           _numberError == null &&
//           _passwordError == null &&
//           _nameController.text.isNotEmpty &&
//           _emailController.text.isNotEmpty &&
//           _nameController.text.isNotEmpty &&
//           _passwordController.text.isNotEmpty) {
//         setState(() {
//           isLoading = true;
//         });
//
//         // Add your registration logic here
//         Future.delayed(const Duration(milliseconds: 200), () {
//           registerUser();
//         });
//       } else {
//         SnackBar snackBar =
//             const SnackBar(content: Text('Please fill details without error'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     }
//
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
//             child: SingleChildScrollView(
//               child: Container(
//                 width: SUwidth1350w,
//                 height: SUheight2250h,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       BoxShadow(
//                           blurRadius: 5,
//                           offset: Offset(0, 0),
//                           color: Colors.black)
//                     ]),
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.only(
//                     top: 50.h, bottom: 20.h, left: 50.w, right: 50.w),
//                 // margin: EdgeInsets.only(
//                 //     left: 50.w, right: 50.w, top: 150.h, bottom: 0.h),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(
//                       height: 400.h,
//                       child: Image.asset('assets/textile_calculator_logo.png'),
//                     ),
//
//                     // Register Text and content
//                     Container(
//                       margin: EdgeInsets.only(bottom: 70.h, top: 50.h),
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Register Here',
//                         style: TextStyle(color: Colors.black, fontSize: 80.sp),
//                       ),
//                     ),
//
//                     // Name
//                     CustomTextFormField(
//                       controller: _nameController,
//                       errorText: _nameError,
//                       onChanged: (value) {
//                         setState(() {
//                           if (value.isEmpty) {
//                             _nameError = 'Name is required';
//                           } else {
//                             _nameError = null;
//                           }
//                         });
//                       },
//                       icon: const Icon(Icons.person),
//                       labelText: 'Enter Name',
//                       isLastField: false,
//                       obscureText: false,
//                       numberKeyboard: false,
//                       enabled: true,
//                     ),
//
//                     // Email
//                     CustomTextFormField(
//                       controller: _emailController,
//                       errorText: _emailError,
//                       onChanged: (value) {
//                         setState(() {
//                           if (value.isEmpty) {
//                             _emailError = 'Email is required';
//                           } else if (!ValidationScripts.emailValidation
//                               .hasMatch(value)) {
//                             _emailError = 'Invalid email format';
//                           } else {
//                             _emailError = null;
//                           }
//                         });
//                       },
//                       icon: const Icon(Icons.email_outlined),
//                       labelText: 'Enter Email',
//                       isLastField: false,
//                       obscureText: false,
//                       numberKeyboard: false,
//                       enabled: true,
//                     ),
//
//                     // Contact Number
//                     CustomTextFormField(
//                       controller: _contactController,
//                       errorText: _numberError,
//                       onChanged: (value) {
//                         setState(() {
//                           if (value.isEmpty) {
//                             _numberError = 'Contact is required';
//                           } else if (!ValidationScripts.contactNumber
//                               .hasMatch(value)) {
//                             _numberError = 'Invalid Number format';
//                           } else {
//                             _numberError = null;
//                           }
//                         });
//                       },
//                       icon: const Icon(Icons.quick_contacts_dialer_outlined),
//                       labelText: 'Enter Conatct Number',
//                       isLastField: false,
//                       obscureText: false,
//                       numberKeyboard: true,
//                       enabled: true,
//                     ),
//
//                     //Password
//                     CustomTextFormField(
//                       controller: _passwordController,
//                       errorText: _passwordError,
//                       obscureText: _obscureText,
//                       onChanged: (value) {
//                         setState(() {
//                           if (value.isEmpty) {
//                             _passwordError = 'Password is required';
//                           } else if (!ValidationScripts.passwordValidation
//                               .hasMatch(value)) {
//                             _passwordError = 'Invalid Password format';
//                           } else {
//                             _passwordError = null;
//                           }
//                         });
//                       },
//                       icon: IconButton(
//                         icon: Icon(_obscureText
//                             ? Icons.visibility_off
//                             : Icons.visibility),
//                         onPressed: () {
//                           setState(() {
//                             _obscureText = !_obscureText;
//                           });
//                         },
//                       ),
//                       labelText: 'Enter Password',
//                       isLastField: true,
//                       numberKeyboard: false,
//                       enabled: true,
//                     ),
//
//                     //Register Button
//                     isLoading
//                         ? const SizedBox(
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           )
//                         : Padding(
//                             padding: EdgeInsets.only(left: 100.w, right: 100.w),
//                             child: ElevatedButton(
//                               onPressed: registerButtonPressed,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                                 // backgroundColor: const Color.fromRGBO(23, 35, 255, 1.0),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50.sp),
//                                 ),
//                               ),
//                               child: CustomTextWithSize(
//                                 text: 'Register',
//                                 color: Colors.white,
//                                 maxLine: 1,
//                                 bold: false,
//                                 size: text70sp,
//                               ),
//                             ),
//                           ),
//
//                     //OR Text
//                     const Text(
//                       '----------- or ----------',
//                       textAlign: TextAlign.center,
//                     ),
//
//                     //Sign Up with google
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: SUwidth100w, right: SUwidth100w),
//                       child: ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           fixedSize: Size.fromHeight(120.h),
//                           foregroundColor: Colors.blue,
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           elevation: 2.0,
//                           shadowColor: Colors.grey.withOpacity(1),
//                         ),
//                         onPressed: () {
//                           //Sign in With Google
//                           CustomAuthService.signInWithGoogle(context);
//                         },
//                         label: const CustomText(
//                           text: 'SignUp With Google',
//                           color: Colors.black,
//                           maxLine: 1,
//                           bold: false,
//                         ),
//                         icon: SizedBox(
//                             height: 100.h,
//                             child:
//                                 Image.asset('assets/google_signin_logo.png')),
//                       ),
//                     ),
//
//                     SizedBox(
//                       height: 10.h,
//                     ),
//
//                     //Already User ,Login Button
//                     TextButton(
//                         style:
//                             TextButton.styleFrom(foregroundColor: Colors.white),
//                         onPressed: () =>
//                             Navigator.of(context).pushNamed('/login_screen'),
//                         child: const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomText(
//                               text: 'Already User?',
//                               color: Colors.black,
//                               maxLine: 1,
//                               bold: false,
//                             ),
//                             CustomText(
//                               text: ' Login Here',
//                               color: Colors.blue,
//                               maxLine: 1,
//                               bold: false,
//                             ),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
