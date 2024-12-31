import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/otp/otpscreen.dart';
import 'package:whatsapp_ui/widgets/uihelper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController phoneController = TextEditingController();
  String selectedCountry = "India";

  List<String> countries = [
    "India",
    "United States",
    "Canada",
    "Australia",
    "United Kingdom",
    "Germany",
    "France",
    "Brazil",
    "Japan",
    "China"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Uihelper.CustomText(
                text: "Enter your phone number",
                height: 20,
                color: Color(0XFF00A884),
                fontweight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Uihelper.CustomText(
              text: "WhatsApp will need to verify your phone", height: 16),
          Uihelper.CustomText(
              text: "number. Carrier charges may apply.", height: 16),
          Uihelper.CustomText(
              text: " What’s my number?", height: 16, color: Color(0XFF00A884)),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: DropdownButtonFormField(
              items: countries.map((String country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  selectedCountry = newvalue!;
                });
              },
              value: selectedCountry,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884)))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "+91",
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)))),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)))),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: Uihelper.CustomButton(
          callback: () {
            login(phoneController.text.toString());
          },
          buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phonenumber) {
    if (phonenumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter Phone Number"),
        backgroundColor: Color(0XFF00A884),
      ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                    phonenumber: phonenumber,
                  )));
    }
  }
}
