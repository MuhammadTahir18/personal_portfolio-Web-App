import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/components.dart';
class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return  Scaffold(
        drawer: DrawerWeb(),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 25.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset("assets/works.jpg", fit: BoxFit.cover,),
                ),
                title: TabWebList(),
              )
            ];
          },
          body:ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 30.0,),
                  SansBold(text: "Works",size: 40.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    AnimatedCard(imagePath: "assets/portfolio.png",width: 300.0,height: 200,
                    ),
                      SizedBox(
                        width: devicewidth/3,
                        child: Column(
                          children: [
                            SansBold(text: "Portfolio",size: 30.0,),
                            SizedBox(height: 15.0,),
                            Sans(text: "Deployed on Android, Ios and Web, the portfolio project truly an achievement. I used Flutter to develop beautiful and responsive Ui and Firebase for backend.",size: 15.0,)
                          ],
                        ),
                      )
                  ],)
                ],
              )
            ],
          ) ,
    ));
  }
}
