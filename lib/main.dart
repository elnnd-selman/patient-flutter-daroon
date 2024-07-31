import 'package:daroon_user/app/binding/initial_binding.dart';
import 'package:daroon_user/app/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/routes/app_pages.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/app_constants.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(EducationAdapter());
  Hive.registerAdapter(PhoneAdapter());

  await Hive.openBox('DaroonBox');

  // runApp(const MyApp());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return GetMaterialApp(
          key: MyApp.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Daroon',
          getPages: AppPages.routes,
          defaultTransition: Transition.cupertino,
          initialRoute: AppPages.initial,
          initialBinding: InitialBindings(),
          theme: ThemeData(
            fontFamily: kFontFamily,
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: AppColors.blackBGColor,
          ),
        );
      });
    });
  }
}
