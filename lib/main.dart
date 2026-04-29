import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/controllers_binding.dart';
import 'app/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NASA Image',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllersBinding(),
      home: const HomeScreen(),
    );
  }
}
