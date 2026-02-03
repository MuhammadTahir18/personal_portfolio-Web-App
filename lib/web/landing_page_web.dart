import 'package:api_flutter/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
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
          ////first section////////
          Container(
            height: deviceheight - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: SansBold(text: "Hello I'm", size: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    SansBold(text: "Muhammad Tahir", size: 55.0),
                    Sans(text: "Flutter Developer", size: 30),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Sans(text: "tahir.appdev@gmail.com", size: 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20),
                        Sans(text: "+923091062836", size: 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20),
                        Sans(text: "Multan Pakistan", size: 15),
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
                      backgroundImage: AssetImage("assets/mynew.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ////second page////
          Container(
            height: deviceheight / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/web.jpg"),
                  height: deviceheight / 1.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "About me", size: 40),
                    SizedBox(height: 15),
                    Sans(
                      text:
                          "Hello i am Muhammad Tahir.  I specialize in Flutter development.",
                      size: 15,
                    ),
                    Sans(
                      text:
                          "I strive to ensure astounding performance with state of ",
                      size: 15,
                    ),
                    Sans(
                      text:
                          "the art security of Android, Ios, Web, Linux, Mac and Windows.",
                      size: 15,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        tealContainer("Flutter"),
                        SizedBox(width: 7),
                        tealContainer("Firebase"),
                        SizedBox(width: 7),
                        tealContainer("Android"),
                        SizedBox(width: 7),
                        tealContainer("Ios"),
                        SizedBox(width: 7),
                        tealContainer("Window"),
                        SizedBox(width: 7),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ////////////third section///////////
          Container(
            height: deviceheight / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(text: "What I do?", size: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "Web Development",
                      reverse: true,
                      fit: BoxFit.contain,
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App Development",
                      reverse: true,
                      fit: BoxFit.contain,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end Development",
                      reverse: true,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          //// forth section////////////
          ContactFormWeb(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
