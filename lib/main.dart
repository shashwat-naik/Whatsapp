import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/home/homescreen.dart';
import 'package:whatsapp_ui/screens/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF00A884)),
        useMaterial3: false,
        fontFamily: "Roboto",
      ),
      home: HomeScreen(),
    );
  }
}
