import 'package:assignment/core/routes/route_name.dart';
import 'package:assignment/core/routes/routes.dart';
import 'package:assignment/core/theme/app_theme.dart';
import 'package:assignment/firebase_options.dart';
import 'package:assignment/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialBinding: BindingsBuilder(
          () {
            Get.put(AuthServices());
          },
        ),
        getPages: Routes.pages,
        initialRoute: RouteName.splash,
      ),
    );
  }
}
