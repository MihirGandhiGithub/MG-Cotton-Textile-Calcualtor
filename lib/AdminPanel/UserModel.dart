import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userID;
  final String name;
  final String email;
  final String phoneNumber;
  final DateTime creationDate;
  final int appOpenCount;
  final DateTime lastAppOpenDate;
  final String selectedRegion;
  final String userRole;
  final String themeMode;

  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.creationDate,
    required this.appOpenCount,
    required this.lastAppOpenDate,
    required this.selectedRegion,
    required this.userRole,
    required this.themeMode,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userID: map['userID'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['PhoneNumber'],
      creationDate: (map['creationDate'] as Timestamp).toDate(),
      appOpenCount: map['appOpenCount'],
      lastAppOpenDate: (map['LastAppOpenDate'] as Timestamp).toDate(),
      selectedRegion: map['selectedRegion'],
      userRole: map['userRole'],
      themeMode: map['themeMode'],
    );
  }
}
