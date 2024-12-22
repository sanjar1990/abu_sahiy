import 'package:abu_sahiy/set_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'data/routes/route_helper.dart';
import 'data/tools/service/lang_service/lang_service.dart';

Future<void> main() async {
  await setup();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final size=MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize:  Size(size.width, size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(

          title: 'Al Fatiha',
          translations: LangService(),
          locale: LangService.defaultLanguage(),
          fallbackLocale: LangService.fallbackLocale,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.getCategorySix(),
          getPages: RouteHelper.routes,
          // home: CategorySix(),
        );
      },
    );
  }
}