import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/app_bindings.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food App',
      // Aktifkan binding untuk inisialisasi controller
      initialBinding: AppBindings(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeView(),  // Mulai dengan HomeView
    );
  }
}
