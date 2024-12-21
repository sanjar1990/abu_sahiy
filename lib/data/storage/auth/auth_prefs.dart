import 'package:hive_flutter/hive_flutter.dart';
import 'auth_holder.dart';

class AuthPrefs extends AuthHolder {
  late Box authBox;

  AuthPrefs() {
    authBox = Hive.box(authBoxID);
  }

  @override
  String get authToken => authBox.get(authTokenId, defaultValue: '');

  @override
  set authToken(String token) => authBox.put(authTokenId, token);

  @override
  String get firstName => authBox.get(firstNameId, defaultValue: '');

  @override
  set firstName(String name) => authBox.put(firstNameId, name);

  @override
  String get lastName => authBox.get(lastNameId, defaultValue: '');

  @override
  set lastName(String name) => authBox.put(lastNameId, name);

  @override
  String get phone => authBox.get(phoneId, defaultValue: '');

  @override
  set phone(String name) => authBox.put(phoneId, name);

  @override
  String get role => authBox.get(roleId, defaultValue: '');

  @override
  set role(String role) => authBox.put(roleId, role);

  @override
  String get fcmToken => authBox.get(fcmTokenId, defaultValue: '');

  @override
  set fcmToken(String fcmToken) => authBox.put(fcmTokenId, fcmToken);

  @override
  Future<void> clearAuth() async => await authBox.clear();

  static const authBoxID = 'auth_hive_box';
  static const roleId = 'role';
  static const authTokenId = 'authToken';
  static const firstNameId = 'firstName';
  static const lastNameId = 'lastName';
  static const phoneId = 'phone';
  static const fcmTokenId = 'fcmToken';
}
