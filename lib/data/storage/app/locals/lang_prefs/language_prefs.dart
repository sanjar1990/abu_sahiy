import 'package:abu_sahiy/data/storage/auth/auth_holder.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LangPrefs extends AuthHolder {
  late Box appBox;

  LangPrefs() {
    appBox = Hive.box(langBox);
  }

  String get lang => appBox.get(langBox, defaultValue: 'uz');

  set lang(String lang) => appBox.put(langBox, lang);

  @override
  Future<void> clearAuth() async => await appBox.clear();

  static const langBox = 'lang';

}
