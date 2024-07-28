import 'package:farm_furniture_factory/auth/ui/login_page.dart';
import 'package:farm_furniture_factory/auth/ui/sign_up_page.dart';
import 'package:farm_furniture_factory/home/domain/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  dependencyInjection();
  runApp(const MyApp());
}

dependencyInjection() {
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpPage(),
    );
  }
}
