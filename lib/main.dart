import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/services.dart';

import 'AdminPanel/admin_panel_home_page.dart';
import 'Screens/Authentication/Login Screen/login_page.dart';
import 'Screens/home_page.dart';
import 'Screens/splashscreen.dart';
import 'Screens/Sub Screens/1 Ginning_Calculator/singal_ginning.dart';
import 'Screens/Sub Screens/2 Dabit_Note/cotton_dabit_note.dart';
import 'Screens/Sub Screens/3 Exports_Calculation/singal_export.dart';
import 'Screens/Sub Screens/4 Oil_Mill_Calculator/singal_oilmill.dart';
import 'Screens/Sub Screens/5 Spinning_Calculator/singal_spinning.dart';
import 'Screens/Sub Screens/6 Conversation_Calculation/home_singal_conversation_calculator.dart';
import 'Screens/Sub Screens/7 Staple Conversation Chart/staple_conversation_chart.dart';
import 'Screens/Sub Screens/8 Conversation Factor/conversation_factor.dart';
import 'Screens/Sub Screens/9 Cotton Quality/cotton_quality_chart.dart';
import 'package:provider/provider.dart';

import 'StageManagementClass/provider_state_management.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the provided configuration
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      // apiKey: "AIzaSyBKXR-8FgwAFhIlFhe-AUhTyxny4M1PdSU",
      // authDomain: "mg-textile-calculator.firebaseapp.com",
      // projectId: "mg-textile-calculator",
      // storageBucket: "mg-textile-calculator.appspot.com",
      // messagingSenderId: "669571586292",
      // appId: "1:669571586292:web:1c4eaa0a39ef38932ba6a1",
      // measurementId: "G-F4CEEJ887T"
      //     ),
      );

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => DropdownState()),
        ChangeNotifierProvider(create: (_) => firebaseConfigrations())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print('Theme mode is : ${themeProvider.themeMode.name} \n \n \n \n ');
    return ScreenUtilInit(
      designSize: const Size(1440, 2560),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            // restorationScopeId: 'roots',

            theme: themeProvider.currentTheme,
            debugShowCheckedModeBanner: false,
            title: 'Textile Calculator',
            //

            initialRoute: '/splash_screen',
            routes: {
              '/splash_screen': (context) => const SplashScreen(),
              '/login_screen': (context) => const LoginPage(),
              // '/register_screen': (context) => const RegisterScreen(),
              '/home_screen': (context) => const HomePage(),
              '/adminPanel_home': (context) => const AdminPanelHome(),
              // '/AddDetail_screen': (context) => AddDetailPage(
              //       user: CustomAuthService.user!,
              //     ),
              // '/profile_screen': (context) => const Profile(),
              '/ginning_screen': (context) =>
                  const HomeSingalGinningCalculator(),
              '/spinning_screen': (context) => const HomeSpinningCalculator(),
              '/oilmill_screen': (context) =>
                  const HomeSingalOilMillCalculator(),
              '/export_screen': (context) => const HomeExportCalculation(),
              '/dabitnote_screen': (context) => const HomeDabietCalculation(),
              '/conversation_screen': (context) =>
                  const HomeSingalConversationCalulator(),
              '/stapleconvert_screen': (context) =>
                  const StapleConversationChart(),
              '/cottonfactor_screen': (context) => const ConversationFactor(),
              '/cottonqulity_screen': (context) => const CottonQualityChart(),
            });
      },
    );
  }
}
