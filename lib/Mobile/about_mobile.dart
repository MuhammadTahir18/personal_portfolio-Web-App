import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            size: 35.0,
            color: Colors.black,
          ),
        ),
        endDrawer:DrawerMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              CircleAvatar(
                backgroundColor: Colors.tealAccent,
                radius: 117.0,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 113.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 110.0,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/mynew.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SansBold(text: "About me", size: 35.0),
                    SizedBox(height: 10.0,),
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
                      "the art security of Android, ios, Web, Linux, Mac and Windows.",
                      size: 15,
                    ),
                    SizedBox(height: 15.0,),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Firebase"),
                        tealContainer("Android"),
                        tealContainer("Ios"),
                        tealContainer("Web"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
              //// web development second part
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              AnimatedCard(imagePath: "assets/webL.png",width: 200,),
                  SizedBox(height: 30.0,),
                  SansBold(text: "Web Development", size: 20.0,),
                  SizedBox(height: 10.0,)
                ],
              ),
              Sans(text:"I'm here to build your presense online with state of art web apps", size: 15.0,),
              ////App development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "assets/app.png",width: 200,reverse: true,),
                  SizedBox(height: 30.0,),
                  SansBold(text: "App Development", size: 20.0,),
                  SizedBox(height: 10.0,)
                ],
              ),
              Sans(text:"Do you need a high-performance app, responsive and beautiful apps? Don't worry, I've got you covered.  ", size: 15.0,),
              ///// backend development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "assets/firebase.png",width: 200,reverse: true,),
                  SizedBox(height: 30.0,),
                  SansBold(text: "Back-end Development", size: 20.0,),
                  SizedBox(height: 10.0,)
                ],
              ),
              Sans(text:"Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can  help you with that    ", size: 15.0,),
              SizedBox(height: 20.0,)
            ],
          ),
        ),
      ),
    );
  }
}
