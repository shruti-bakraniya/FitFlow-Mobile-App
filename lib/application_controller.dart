import 'package:fitflow/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  Future<Widget> screenFunction() async {
    // Simulating some asynchronous operation, like fetching data or performing initialization
    await initializeApp();

    // Redirect to the login page after the initialization is complete
    Get.offAllNamed(AppRoutes.homePage);

    return Container(); // Returning a container as this function expects a Widget
  }

  // Method to perform initialization tasks
  Future<void> initializeApp() async {
    try {
      // Example: Fetching data from an API
      await fetchData();

      // Example: Initializing some services or resources
      await initializeServices();

      // You can add more tasks here as needed
    } catch (error) {
      // Handle errors during initialization
      print('Initialization error: $error');
    }
  }

  // Simulated fetch data method
  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Data fetched');
  }

  // Simulated initialize services method
  Future<void> initializeServices() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Services initialized');
  }
}