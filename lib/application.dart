import 'package:fitflow/application_controller.dart';
import 'package:fitflow/constant/constants.dart';
import 'package:fitflow/routes/app_pages.dart';
import 'package:fitflow/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      init: ApplicationController(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorConst.colorWhite,
            ),
            scaffoldBackgroundColor: ColorConst.colorWhite,
          ),
          initialRoute: AppRoutes.homePage,
          getPages: AppPages.list,
        );
      },
    );
  }
}
