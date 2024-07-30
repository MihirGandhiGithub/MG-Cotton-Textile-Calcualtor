import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../AdminPanel/UserModel.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class firebaseConfigrations extends ChangeNotifier {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static User? user = auth.currentUser;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static DocumentSnapshot? userSnapshot;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static String userName = '';
  static String userEmail = '';
  static String userPhoneNumber = '';
  static String userRole = '';
  bool _isLoading = false;
  bool _isLoadingApple = false;
  bool _loadUserCount = false;

  static String userCount = '';
  static String darkModeUserCount = '';
  static String appOpenedTodayCount = '';
  static String todayJointedUserCount = '';
  static UserModel? userModel;
  List<UserModel> allUsers = [];

  //
  String get userNameg => userName;
  String get userEmailg => userEmail;
  String get userPhoneNumberg => userPhoneNumber;
  String get userRoleg => userRole;

  FirebaseAuth get selectedValue => auth;
  User? get isInitialized => user;
  bool get isLoading => _isLoading;
  bool get isLoadingApple => _isLoadingApple;
  bool get isloadUserCount => _loadUserCount;

  String get userCountg => userCount;
  String get darkModeUserCountg => darkModeUserCount;
  String get appOpenedTodayCountg => appOpenedTodayCount;
  String get todayJointedUserCountg => todayJointedUserCount;

  //Sign in with Google
  Future<void> signInWithGoogle(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      user = userCredential.user;

      // Store user information
      if (user != null) {
        userName = user!.displayName ?? '';
        userEmail = user!.email ?? '';
        userPhoneNumber = user!.phoneNumber ?? '';
        await _createUserDocumentIfNotExists(userCredential);
        notifyListeners();

        Navigator.pushReplacementNamed(context, '/home_screen');
      }
    } catch (e) {
      print("Error during Google sign-in: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //Sign in with apple
  Future<void> signInWithApple(BuildContext context) async {
    _isLoadingApple = true;
    notifyListeners();

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(oauthCredential);
      user = userCredential.user;

      if (appleCredential == null) {
        _isLoadingApple = false;
        notifyListeners();
        return;
      }

      // Store user information
      if (user != null) {
        print('\n apple sign in data is : ${user.toString()} \n');
        userName = user!.displayName ?? '';
        userEmail = user!.email ?? '';
        userPhoneNumber = user!.phoneNumber ?? '';
        await _createUserDocumentIfNotExists(userCredential);
        notifyListeners();

        Navigator.pushReplacementNamed(context, '/home_screen');
      }
    } catch (e) {
      print("Error during Apple sign-in: $e");
    } finally {
      _isLoadingApple = false;
      notifyListeners();
    }
  }

  Future<void> _createUserDocumentIfNotExists(
      UserCredential userCredential) async {
    final userDocRef =
        firestore.collection('users').doc(userCredential.user!.uid);

    userSnapshot = await userDocRef.get();
    if (!userSnapshot!.exists) {
      await userDocRef.set({
        'userID': userCredential.user!.uid,
        'name': userName,
        'email': userEmail,
        'PhoneNumber': userPhoneNumber,
        'creationDate': FieldValue.serverTimestamp(),
        'appOpenCount': 0,
        'LastAppOpenDate': FieldValue.serverTimestamp(),
        'selectedRegion': 'All in one',
        'userRole': '0',
        'themeMode': 'light',
        'userType': 'free',
        'premiumStartDate': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> fetchUserData() async {
    if (auth.currentUser != null) {
      final userDocRef =
          firestore.collection('users').doc(auth.currentUser!.uid);
      userSnapshot = await userDocRef.get();
      if (userSnapshot != null) {
        userName = userSnapshot!['name'];
        userEmail = userSnapshot!['email'];
        userPhoneNumber = userSnapshot!['PhoneNumber'];
        userRole = userSnapshot!['userRole'];
        await updateUserLastOpendApp(userSnapshot!['appOpenCount']);
        notifyListeners();
      }
    }
  }

  Future<void> fetchAllUserData() async {
    _isLoading = true;
    notifyListeners();
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('creationDate',
              descending: true) // Order by creationDate descending
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<UserModel> users = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return UserModel.fromMap(data);
        }).toList();

        // Update the list of users
        allUsers = users;

        // Notify listeners if needed
        notifyListeners();
      } else {
        print('No users found in the collection');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLimitedUserData() async {
    _isLoading = true;
    notifyListeners();
    try {
      allUsers.clear();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('creationDate', descending: true)
          .limit(20) // Order by creationDate descending
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<UserModel> users = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return UserModel.fromMap(data);
        }).toList();

        // Update the list of users
        allUsers = users;

        // Notify listeners if needed
        notifyListeners();
      } else {
        print('No users found in the collection');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Todays`s App Joinner
  Future<void> fetchTodayJoinnerUserData() async {
    _isLoading = true;
    notifyListeners();
    try {
      allUsers.clear();

      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('creationDate', descending: true)
          .where('creationDate', isGreaterThanOrEqualTo: startOfDay)
          // Order by LastAppOpenDate descending
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<UserModel> users = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return UserModel.fromMap(data);
        }).toList();

        // Update the list of users
        allUsers = users;

        // Notify listeners if needed
        notifyListeners();
      } else {
        print('No users found in the collection');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Todays`s App Opened
  Future<void> fetchTodayOPenedUserData() async {
    _isLoading = true;
    notifyListeners();
    try {
      allUsers.clear();

      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('LastAppOpenDate', descending: true)
          .where('LastAppOpenDate', isGreaterThanOrEqualTo: startOfDay)
          // Order by LastAppOpenDate descending
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<UserModel> users = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return UserModel.fromMap(data);
        }).toList();

        // Update the list of users
        allUsers = users;

        // Notify listeners if needed
        notifyListeners();
      } else {
        print('No users found in the collection');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserLastOpendApp(int count) async {
    if (auth.currentUser != null) {
      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid);
      await userDocRef.update(
          {'LastAppOpenDate': DateTime.now(), 'appOpenCount': count + 1});
    }
  }

  Future<void> fetchDarkModeUserData() async {
    _isLoading = true;
    notifyListeners();
    try {
      allUsers.clear();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('LastAppOpenDate', descending: true)
          .where('themeMode',
              isEqualTo: 'dark') // Order by creationDate descending
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<UserModel> users = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return UserModel.fromMap(data);
        }).toList();

        // Update the list of users
        allUsers = users;
      } else {
        print('No users found in the collection');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateFirebaseTheme(String themeMode) async {
    // User? user = FirebaseAuth.instance.currentUser;
    if (auth.currentUser != null) {
      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid);
      await userDocRef.update({'themeMode': themeMode});
    }
  }

  Future<void> updateFirebaseRegion(String region) async {
    // User? user = FirebaseAuth.instance.currentUser;
    if (auth.currentUser != null) {
      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid);
      await userDocRef.update({'selectedRegion': region});
    }
  }

  Future<void> getUserCounts() async {
    _loadUserCount = true;
    notifyListeners();
    try {
      // Aggregate query to get total user count
      final totalUserCountQuery = firestore.collection('users').count();
      final totalUserCountSnapshot = await totalUserCountQuery.get();
      userCount = totalUserCountSnapshot.count.toString();

      // Get the current date and start of the day
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);

      // Aggregate query to get the count of users who opened the app today
      final appOpenedTodayQuery = firestore
          .collection('users')
          .where('LastAppOpenDate', isGreaterThanOrEqualTo: startOfDay)
          .count();
      final appOpenedTodaySnapshot = await appOpenedTodayQuery.get();
      appOpenedTodayCount = appOpenedTodaySnapshot.count.toString();

      // Aggreagate query to get the count of users who jointed today
      final appJoinedTodayQuery = firestore
          .collection('users')
          .where('creationDate', isGreaterThanOrEqualTo: startOfDay)
          .count();
      final appJoinedTodaySnapshot = await appJoinedTodayQuery.get();
      todayJointedUserCount = appJoinedTodaySnapshot.count.toString();

      // Aggregate query for dark mode users
      final darkModeUserQuery = firestore
          .collection('users')
          .where('themeMode', isEqualTo: 'dark')
          .count();
      final darkModeUserSnapshot = await darkModeUserQuery.get();
      darkModeUserCount = darkModeUserSnapshot.count.toString();
    } catch (e) {
      print("Error fetching user counts: $e");
    } finally {
      _loadUserCount = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
    user = null;
    notifyListeners();
  }
}

class DropdownState extends ChangeNotifier {
  String _selectedValue = 'All in one';
  static const String _key = 'selectedDropdownValue';
  bool _isInitialized = false;

  String get selectedValue => _selectedValue;
  bool get isInitialized => _isInitialized;
  final firebaseConfigrations _firebaseConfigrations = firebaseConfigrations();

  DropdownState() {
    _loadValue();
  }

  void updateValue(String newValue) async {
    _selectedValue = newValue;
    if (!Platform.isIOS)
      await _firebaseConfigrations.updateFirebaseRegion(newValue);
    _saveValue(newValue);
    print('New value is $newValue \n \n \n');
    notifyListeners();
  }

  Future<void> _saveValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, value);
    print('shared preference stored is $value \n \n \n');
  }

  Future<void> _loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedValue = prefs.getString(_key) ?? 'All in one';
    _isInitialized = true;
    notifyListeners();
  }
}

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.black38,
    ),
    navigationDrawerTheme: NavigationDrawerThemeData(
      shadowColor: Colors.blue,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white, // Set the background color of the drawer
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
        // bodySmall: TextStyle(color: Colors.black),
        // bodyMedium: TextStyle(color: Colors.black54),
        // bodyLarge: TextStyle(color: Colors.blue),
        ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.blue[50],
      border: OutlineInputBorder(),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.blueAccent,
      elevation: 5,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.blue[100]!,
      disabledColor: Colors.grey,
      selectedColor: Colors.blue[300]!,
      secondarySelectedColor: Colors.blue[200]!,
      padding: EdgeInsets.all(8),
      labelStyle: TextStyle(color: Colors.black),
      secondaryLabelStyle: TextStyle(color: Colors.black54),
      brightness: Brightness.light,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.blue,
      inactiveTrackColor: Colors.blue[100],
      thumbColor: Colors.blueAccent,
      overlayColor: Colors.blue.withAlpha(32),
      valueIndicatorColor: Colors.blueAccent,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      contentTextStyle: TextStyle(color: Colors.black54),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    )));

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: Colors.black12,
  hintColor: Colors.white,
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: Colors.grey[850],
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: Colors.red,
    unselectedLabelColor: Colors.white70,
  ),
  navigationDrawerTheme: NavigationDrawerThemeData(
    shadowColor: Colors.grey[850],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey[800],
    foregroundColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey[800],
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.white38),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),
  textTheme: TextTheme(
      // bodyText1: TextStyle(color: Colors.white),
      // bodyText2: TextStyle(color: Colors.white70),
      // headline1: TextStyle(color: Colors.white),
      // headline6: TextStyle(color: Colors.white70),
      ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white70,
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.grey.shade200),
    activeIndicatorBorder: BorderSide(color: Colors.white),
    outlineBorder: BorderSide(color: Colors.white),

    // filled: true,
    // fillColor: Colors.grey[900],
    // border: OutlineInputBorder(),
  ),
  cardTheme: CardTheme(
    color: Colors.grey[850],
    shadowColor: Colors.black,
    elevation: 5,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[700]!,
    disabledColor: Colors.grey[600],
    selectedColor: Colors.grey[800]!,
    secondarySelectedColor: Colors.grey[700]!,
    padding: EdgeInsets.all(8),
    labelStyle: TextStyle(color: Colors.white),
    secondaryLabelStyle: TextStyle(color: Colors.white70),
    brightness: Brightness.dark,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.white,
    inactiveTrackColor: Colors.white70,
    thumbColor: Colors.grey[800],
    overlayColor: Colors.white.withAlpha(32),
    valueIndicatorColor: Colors.grey[800],
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.grey[850],
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    contentTextStyle: TextStyle(color: Colors.white70),
  ),
);

enum ThemeModeType { Light, Dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _lightTheme = lightTheme;
  ThemeData _darkTheme = darkTheme;

  ThemeData _currentTheme;
  ThemeModeType _currentThemeMode;

  ThemeData get currentTheme => _currentTheme;
  ThemeModeType get themeMode => _currentThemeMode;

  // Initialize shared preferences
  late SharedPreferences _prefs;

  final firebaseConfigrations _firebaseConfigrations = firebaseConfigrations();

  bool _isLoading = true; // Add a loading state
  bool get isLoading => _isLoading;

  ThemeProvider()
      : _currentTheme = lightTheme,
        _currentThemeMode = ThemeModeType.Light {
    _loadTheme();
  }

  void _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    int? themeModeIndex = _prefs.getInt('theme_mode');
    _currentThemeMode = ThemeModeType.values[themeModeIndex ?? 0];
    _currentTheme =
        _currentThemeMode == ThemeModeType.Light ? _lightTheme : _darkTheme;
    _isLoading = false; // Set loading to false after loading theme
    notifyListeners();
  }

  void _saveTheme() {
    _prefs.setInt('theme_mode', _currentThemeMode.index);
  }

  void toggleTheme() async {
    _isLoading = true; // Set loading to true before toggling theme
    notifyListeners();

    if (_currentThemeMode == ThemeModeType.Light) {
      _currentTheme = _darkTheme;
      _currentThemeMode = ThemeModeType.Dark;
      await _firebaseConfigrations.updateFirebaseTheme('dark');
    } else {
      _currentTheme = _lightTheme;
      _currentThemeMode = ThemeModeType.Light;
      await _firebaseConfigrations.updateFirebaseTheme('light');
    }
    _saveTheme(); // Save selected theme mode
    _isLoading = false; // Set loading to false after toggling theme
    notifyListeners();
  }
}

// class ThemeProvider extends ChangeNotifier {
//   ThemeData _lightTheme = lightTheme;
//   ThemeData _darkTheme = darkTheme;
//
//   ThemeData _currentTheme;
//   ThemeModeType _currentThemeMode;
//
//   ThemeData get currentTheme => _currentTheme;
//
//   // Initialize shared preferences
//   late SharedPreferences _prefs;
//
//   final firebaseConfigrations _firebaseConfigrations = firebaseConfigrations();
//
//   ThemeProvider()
//       : _currentTheme = lightTheme,
//         _currentThemeMode = ThemeModeType.Light {
//     _loadTheme();
//   }
//
//   void _loadTheme() async {
//     _prefs = await SharedPreferences.getInstance();
//     int? themeModeIndex = _prefs.getInt('theme_mode');
//     _currentThemeMode = ThemeModeType.values[themeModeIndex ?? 0];
//     _currentTheme =
//         _currentThemeMode == ThemeModeType.Light ? _lightTheme : _darkTheme;
//     notifyListeners();
//   }
//
//   void _saveTheme() {
//     _prefs.setInt('theme_mode', _currentThemeMode.index);
//   }
//
//   void toggleTheme() async {
//     if (_currentThemeMode == ThemeModeType.Light) {
//       _currentTheme = _darkTheme;
//       _currentThemeMode = ThemeModeType.Dark;
//       await _firebaseConfigrations.updateFirebaseTheme('dark');
//     } else {
//       _currentTheme = _lightTheme;
//       _currentThemeMode = ThemeModeType.Light;
//       await _firebaseConfigrations.updateFirebaseTheme('light');
//     }
//     _saveTheme(); // Save selected theme mode
//     notifyListeners();
//   }
// }
