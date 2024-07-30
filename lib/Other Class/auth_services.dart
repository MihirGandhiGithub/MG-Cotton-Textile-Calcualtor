// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Constants/Global_Variables/variables/variables.dart';
//
// class CustomAuthService {
//   static final FirebaseAuth auth = FirebaseAuth.instance;
//   static User? user = auth.currentUser;
//   static final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   static DocumentSnapshot? userSnapshot;
//   static final GoogleSignIn googleSignIn = GoogleSignIn();
//   static String userName = '';
//   static String userEmail = '';
//   static String userPhoneNumber = '';
//
//   // Google Sign in
//   static Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//
//       // Show loading dialog
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return Dialog(
//             backgroundColor: Colors.transparent,
//             child: Container(
//               height: 150.h,
//               alignment: Alignment.center,
//               // Set the desired height here
//               child: const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser!.authentication;
//
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//           await auth.signInWithCredential(credential);
//
//       // Check if the user already exists in Firestore
//       final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user?.uid)
//           .get();
//
//       // ... Rest of the code for checking and creating user data ...
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       if (userSnapshot.exists) {
//         // User already exists, retrieve their data from Firestore
//         final Map<String, dynamic>? userData =
//             userSnapshot.data() as Map<String, dynamic>?;
//
//         if (userData != null) {
//           CustomAuthService.userName = userData['name'].toString();
//           CustomAuthService.userEmail = userData['email'].toString();
//           CustomAuthService.userPhoneNumber =
//               userData['contactNumber'].toString();
//           // Check if the 'admin' field exists in the userData map
//           bool isAdmin = userData['admin'] ?? false;
//
//           if (isAdmin) {
//             await prefs.setString('admin', 'true');
//             // Navigate to the admin home screen
//             // CustomNavigationClass.AdminPanelHomePage(context);
//             Navigator.pushReplacementNamed(context, '/adminPanel_home');
//           } else {
//             await prefs.setString('admin', 'false');
//
//             // Check if any required fields are empty
//             final String? name = userData['name'];
//             final String? email = userData['email'];
//             final String? contactNumber = userData['contactNumber'];
//
//             if (name == null ||
//                 email == null ||
//                 contactNumber == null ||
//                 contactNumber.isEmpty) {
//               // If any required field is empty, move to add detail page
//               // CustomNavigationClass.AddUserDetailPage(context);
//               Navigator.pushReplacementNamed(context, '/AddDetail_screen');
//             } else {
//               // All required fields are present, move to home page
//               // CustomNavigationClass.Homepage(context);
//               Navigator.pushReplacementNamed(context, '/home_screen');
//             }
//           }
//         }
//       } else {
//         // User does not exist in Firestore, proceed with creating a new user document
//         final String? name = googleUser.displayName;
//         final String email = googleUser.email;
//         // const String contactNumber = ""; // No need to set this here
//
//         // Create a document with a unique identifier in the "users" collection
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user?.uid)
//             .set({
//           'userID': userCredential.user!.uid,
//           'name': name,
//           'email': email,
//           'PhoneNumber': '',
//           'creationDate': FieldValue.serverTimestamp(),
//           'appOpenCount': '0',
//           'LastAppOpenDate': FieldValue.serverTimestamp(),
//           'selectedRegion': '',
//
//           // 'contactNumber': contactNumber, // No need to set this here
//         });
//
//         // Remove the loading dialog
//         Navigator.of(context, rootNavigator: true).pop();
//         // Move to add detail page since some fields are empty
//         // CustomNavigationClass.AddUserDetailPage(context)
//         Navigator.pushReplacementNamed(context, '/AddDetail_screen');
//       }
//     } catch (error) {
//       // Sign-in with Google failed
//       // Display an error message or perform appropriate error handling
//       // Remove the loading dialog
//       Navigator.of(context, rootNavigator: true).pop();
//       SnackBar snackBar =
//           SnackBar(content: Text('Error signing in with Google: $error'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
// }
