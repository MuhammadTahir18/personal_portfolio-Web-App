import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: TabWebList(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SansBold(text: "About me", size: 40.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Hello! I am Muhammad Tahir I specialize in flutter development",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "I strive to ensure astounding performance state of ",
                      size: 15.0,
                    ),
                    Sans(
                      text:
                          "the art security for Android, Ios, Web, Mac,  Linux and Windows",
                      size: 15.0,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        tealContainer("Flutter"),
                        SizedBox(width: 7.0),
                        tealContainer("Firebase"),
                        SizedBox(width: 7.0),
                        tealContainer("Android"),
                        SizedBox(width: 7.0),
                        tealContainer("Ios"),
                        SizedBox(width: 7.0),
                        tealContainer("Window"),
                        SizedBox(width: 7.0),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/mynew.png",
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///  second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/webL.png",
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(
                width: devicewidth / 3,
                child: Column(
                  children: [
                    SansBold(text: "Web Development", size: 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "I'm here to build your presence online with state of art  web apps. ",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: devicewidth / 3,
                child: Column(
                  children: [
                    SansBold(text: "App Development", size: 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      text:
                          "Do you need high performance, responsive and beautiful apps? Don't worry,I've got you covered. ",
                      size: 15.0,
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: "assets/app.png",
                width: 250.0,
                height: 250.0,
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/firebase.png",
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(
                width: devicewidth/3,
                child: Column(
                  children: [
                    SansBold(text: "Back-end Development", size: 30.0,),
                    SizedBox(height: 15.0,),
                    Sans(text: "Do you  want your back-end to be highly scalable and secure. Let's have a conservation on how I can help you with that. ",size: 15.0,),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
