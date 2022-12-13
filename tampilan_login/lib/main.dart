import 'package:flutter/material.dart';
import 'package:tampilan_login/constants/text.dart';
import 'package:tampilan_login/ui/splash/splash_screen.dart';
import 'constants/style_constant.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SetText.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: defaultc200Color,
        scaffoldBackgroundColor: whiteColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
