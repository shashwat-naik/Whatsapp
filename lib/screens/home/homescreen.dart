import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/home/calls/callscreen.dart';
import 'package:whatsapp_ui/screens/home/camera/camerascreen.dart';
import 'package:whatsapp_ui/screens/home/chats/chatscreen.dart';
import 'package:whatsapp_ui/screens/home/status/statusscreen.dart';
import 'package:whatsapp_ui/widgets/uihelper.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ]),
          toolbarHeight: 80,
          title: Uihelper.CustomText(
              text: "WhatsApp", height: 20, color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/Search.png")),
            )
          ],
        ),
        body: TabBarView(children: [
          CameraScreen(),
          Chatscreen(),
          Statusscreen(),
          Callscreen()
        ]),
      ),
    );
  }
}
