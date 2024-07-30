// import 'package:flutter/material.dart';
// import 'package:kt1_textile_calculator/Screens/Authentication/Login%20Screen/login_page.dart';
// import 'package:kt1_textile_calculator/Screens/Authentication/Register%20Screen/register_page.dart';
// import 'package:kt1_textile_calculator/Screens/Sub%20Screens/8%20Conversation%20Factor/conversation_factor.dart';
// import 'package:kt1_textile_calculator/Screens/Sub%20Screens/9%20Cotton%20Quality/cotton_quality_chart.dart';
// import 'package:kt1_textile_calculator/Screens/User_Profile/profile.dart';
// import '../AdminPanel/admin_panel_home_page.dart';
// import '../Screens/Authentication/Login Screen/update_userdetail.dart';
//
// import '../Screens/Home_page/home_page.dart';
// import '../Screens/Sub Screens/1 Ginning_Calculator/singal_ginning.dart';
// import '../Screens/Sub Screens/3 Exports_Calculation/singal_export.dart';
// import '../Screens/Sub Screens/4 Oil_Mill_Calculator/singal_oilmill.dart';
// import '../Screens/Sub Screens/5 Spinning_Calculator/singal_spinning.dart';
// import '../Screens/Sub Screens/6 Conversation_Calculation/home_singal_conversation_calculator.dart';
// import '../Screens/Sub Screens/7 Staple Conversation Chart/staple_conversation_chart.dart';
//
// class CustomNavigationClass {
//   //Login Screen
//   static loginPage(BuildContext context) =>
//       NavigationAnimation().Animation2(context, const LoginPage());
//
//   //Register Screen
//   static RegisterPage(BuildContext context) =>
//       NavigationAnimation().Animation2(context, const RegisterScreen());
//
//   //Home Page Screen
//   static Homepage(BuildContext context) =>
//       NavigationAnimation().Animation1WithBackOff(context, const HomePage());
//
//   static AdminPanelHomePage(BuildContext context) => NavigationAnimation()
//       .Animation1WithBackOff(context, const AdminPanelHome());
//
//   static AddUserDetailPage(BuildContext context) => NavigationAnimation()
//       .Animation1WithBackOff(context, const AddDetailPage());
//
//   //Sub Screens From Home Page
//
//   //1 Ginning
//   static GinningCalculator(BuildContext context) => NavigationAnimation()
//       .Animation1(context, const HomeSingalGinningCalculator());
//
//   //2 Oil Mill
//   static OilMillCalculator(BuildContext context) => NavigationAnimation()
//       .Animation1(context, const HomeSingalOilMillCalculator());
//
//   //3 Spinning
//   static SpinningCalculator(BuildContext context) =>
//       NavigationAnimation().Animation1(context, const HomeSpinningCalculator());
//
//   //4 Export
//   static ExportCalculator(BuildContext context) =>
//       NavigationAnimation().Animation1(context, const HomeExportCalculation());
//
//   //5 Coversation
//   static ConversationCalculator(BuildContext context) => NavigationAnimation()
//       .Animation1(context, const HomeSingalConversationCalulator());
//
//   //7 Staple Conversation Chart
//   static StapleConversationBox(BuildContext context) => NavigationAnimation()
//       .Animation1(context, const StapleConversationChart());
//
//   //8 Conversation Factor
//   static ConversationFactorBox(BuildContext context) =>
//       NavigationAnimation().Animation1(context, const ConversationFactor());
//
//   //9 Cotton Quality
//   static CottonQualityBox(BuildContext context) =>
//       NavigationAnimation().Animation1(context, const CottonQualityChart());
//
//   //User Profile Page
//   static UserProfilePage(BuildContext context) =>
//       NavigationAnimation().Animation1(context, const Profile());
// }
//
// //Animation of Page When page is moving
// class NavigationAnimation {
//   void Animation1(BuildContext context, Widget page) {
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => page,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           var begin = 0.01;
//           var end = 1.0;
//           var curve = Curves.easeInOut;
//
//           var tween =
//               Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//           var opacityAnimation = animation.drive(tween);
//
//           return FadeTransition(opacity: opacityAnimation, child: child);
//         },
//       ),
//     );
//   }
//
//   void Animation2(BuildContext context, Widget page) {
//     Navigator.push(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => page,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;
//
//           var tween =
//               Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//           var offsetAnimation = animation.drive(tween);
//
//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//       ),
//     );
//   }
//
//   void Animation1WithBackOff(BuildContext context, Widget page) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => page,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;
//
//           var tween =
//               Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//           var offsetAnimation = animation.drive(tween);
//
//           return SlideTransition(position: offsetAnimation, child: child);
//         },
//       ),
//       (Route<dynamic> route) =>
//           false, // Remove all previous routes from the stack
//     );
//   }
// }
