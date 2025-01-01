import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/profile/profilescreen.dart';
import 'package:whatsapp_ui/widgets/uihelper.dart';

class OtpScreen extends StatelessWidget {
  String phonenumber;
  OtpScreen({Key? key, required this.phonenumber});

  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();
  // const OtpScreen({super.key, required String phonenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Uihelper.CustomText(
                text: "Verifying your number",
                height: 20,
                color: Color(0XFF00A884),
                fontweight: FontWeight.bold),
            const SizedBox(height: 30),
            Uihelper.CustomText(
                text: "You've tried to register +91 ${phonenumber}",
                height: 15),
            Uihelper.CustomText(
                text: "recently. Specify the code for verification.",
                height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(text: "Wrong number ! ", height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Uihelper.CustomText(
                      text: "Edit",
                      height: 15,
                      color: const Color(0XFF00A884)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomContainer(otp1Controller),
                const SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp2Controller),
                const SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp3Controller),
                const SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp4Controller),
                const SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp5Controller),
                const SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp6Controller)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Uihelper.CustomText(
                text: "Didn't receive code?",
                height: 14,
                color: Color(0XFF00A884))
          ],
        ),
      ),
      floatingActionButton: Uihelper.CustomButton(
          callback: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profilescreen()));
          },
          buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
