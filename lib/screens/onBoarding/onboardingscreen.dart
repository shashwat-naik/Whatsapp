import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/login/loginscreen.dart';
import 'package:whatsapp_ui/widgets/uihelper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding.png"),
            SizedBox(height: 30,),
            Uihelper.CustomText(text: "Welcome to WhatsApp", height: 23,color: Color(0XFF000000), fontweight: FontWeight.bold),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(text: "Read our ", height: 14),
                Uihelper.CustomText(text: " Privacy Policy. ", height: 14, color: Color(0XFF0C42CC)),
                Uihelper.CustomText(text: "Tap ''Agree and continue'' ", height: 14),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(text: "to accept the ", height: 14),
                Uihelper.CustomText(text: "Terms of Service. ", height: 14, color: Color(0XFF0C42CC)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Uihelper.CustomButton(callback: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }, buttonname: "Agree and continue"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
