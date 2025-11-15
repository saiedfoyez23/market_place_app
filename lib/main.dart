import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Verified Plug App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent,),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.green;
            } else {
              return Colors.grey.shade300;
            }
          }),
        ),
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }
}
