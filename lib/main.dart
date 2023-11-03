import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:invoice_generator/app/modules/Splash/controllers/splash_controller.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';
import 'package:invoice_generator/services/fcm_services.dart';
import 'package:kiwi/kiwi.dart';

import 'app/global/Utils/app_module.dart';
import 'firebase_options.dart';

initFcm() async {
  Get.put<FCMService>(FCMService()..init());
}

late KiwiContainer app;
GetStorage box = GetStorage();

Future<void> main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  app = KiwiContainer();
  initFcm();

/*
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
*/

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);

  /*FirebaseMessaging messaging = FirebaseMessaging.instance;

   NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  ); */

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    runApp(const MyApp());
    Get.put(SplashController());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        // navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: const Size(430, 930),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            title: "Invoice Manager",
            theme: ThemeData(
              fontFamily: 'SF-Pro-Display',
            ),
            debugShowCheckedModeBanner: false,
            enableLog: true,
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          );
        },
      ),
    );
  }
}
