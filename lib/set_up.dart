import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'data/storage/auth/auth_prefs.dart';
import 'data/tools/cloud_messaging_service/cloud_messaging_service.dart';
import 'injection.dart';


Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await DIService.init();
  await Hive.initFlutter();
  await Hive.openBox(AuthPrefs.authBoxID);

  // await Hive.openBox(AppHolderImp.commonId);

  await Hive.openBox(LangPrefs.langBox);

 // await LocalNotificationService().initialize();
}