import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/onBoarding/onboardingscreen.dart';
import 'package:whatsapp_ui/widgets/uihelper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/whatsapp 1.png"),
            SizedBox(
              height: 15,
            ),
            Uihelper.CustomText(
                text: "WhatsApp", height: 20, fontweight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
