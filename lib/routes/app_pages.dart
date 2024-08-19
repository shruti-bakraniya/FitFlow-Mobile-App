import 'package:fitflow/feature/pages.dart';
import 'package:fitflow/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages{
  static var list = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.assessmentEntryPage,
      page: () => const AssessmentEntryPage(),
    ),
  ];
}