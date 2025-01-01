import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui/Screens/Home/homescreen.dart';
import 'package:whatsapp_ui/widgets/uihelper.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> _requestPermissions() async {
  await Permission.camera.request();
  await Permission.photos.request();
}

class Profilescreen extends StatefulWidget {
  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  TextEditingController nameController = TextEditingController();

  File? pickedimage;

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
                text: "Profile info",
                height: 20,
                color: Color(0XFF00A884),
                fontweight: FontWeight.bold),
            const SizedBox(height: 30),
            Uihelper.CustomText(
                text: "Please provide your name and an optional ", height: 15),
            Uihelper.CustomText(text: "profile photo.", height: 15),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                _openBottom(context);
              },
              child: pickedimage == null
                  ? CircleAvatar(
                      radius: 90,
                      backgroundColor: Color.fromARGB(190, 217, 217, 217),
                      child: Image.asset(
                        "assets/images/photo-camera 1.png",
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CircleAvatar(
                      radius: 90,
                      backgroundImage: FileImage(pickedimage!),
                    ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        hintStyle: TextStyle(color: Color(0XFF5E5E5E)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF00A882))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF00A882))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF00A882)))),
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/happy-face 1.png",
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Uihelper.CustomButton(
          callback: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _openBottom(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        icon: Icon(
                          Icons.image,
                          size: 80,
                          color: Colors.grey,
                        ))
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<void> _pickImage(ImageSource imagesource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imagesource);
      if (photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        pickedimage = tempimage;
      });
    } catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.toString()),
        backgroundColor: Color(0XFF00A884),
      ));
    }
  }
}
