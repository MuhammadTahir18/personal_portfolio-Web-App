import 'package:api_flutter/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: DrawerMobile(),

      // ================= BODY =================
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ✅ mobile fix
              children: [
                // Profile image CENTER
                Center(
                  child: CircleAvatar(
                    radius: 117.0,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 113.0,
                      backgroundColor: Colors.black,
                      child: const CircleAvatar(
                        radius: 110.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/mynew.png"),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25.0),

                // Text START (left)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: SansBold(text: "Hello I'm", size: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    SansBold(text: "Muhammad Tahir", size: 40.0),
                    Sans(text: "Flutter Developer", size: 20.0),
                    SizedBox(height: 15),

                    // Contact row START
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 3.0,
                          children: const [
                            Icon(Icons.email),
                            Icon(Icons.call),
                            Icon(Icons.location_pin),
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 9.0,
                          children: [
                            Sans(text: "tahir.appdev@gmail.com", size: 15),
                            Sans(text: "+923091062836", size: 15),
                            Sans(text: "Multan, Pakistan", size: 15),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 90.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold(text: "About me", size: 35.0),
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
                SizedBox(height: 15.0),
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
                ),
              ],
            ),
          ),
          SizedBox(height: 60.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold(text: "What I do?", size: 35.0),
              AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web Development",
                reverse: true,
                fit: BoxFit.contain,
                width: 300,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                imagePath: "assets/app.png",
                text: "App Development",
                reverse: true,
                fit: BoxFit.contain,
                width: 300,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                imagePath: "assets/firebase.png",
                text: "Back-end Development",
                reverse: true,
                fit: BoxFit.contain,
                width: 300,
              ),
              SizedBox(height: 60.0),
              ContactFormMobile(),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}
