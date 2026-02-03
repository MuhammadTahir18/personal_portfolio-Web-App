import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

Logger logger = Logger();

class ButtonNav extends StatelessWidget {
  final page;
  final String text;
  const ButtonNav({super.key, this.page, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 30),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 70,
        color: Colors.black,
        child: OpenSans(text: text, color: Colors.white, fontSize: 25.0),
      ),
    );
  }
}

class OpenSans extends StatelessWidget {
  final text;
  final color;
  final fontSize;
  OpenSans({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 15, color: Colors.black));
  }
}
///////////////////////////web///////////////
class TabsWeb extends StatefulWidget {
  final title;
  final route;

  TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}
class _TabsWebState extends State<TabsWeb> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelect = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelect = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: Duration(microseconds: 100),
          curve: Curves.elasticIn,
          style: isSelect
              ? GoogleFonts.roboto(
            shadows: [Shadow(color: Colors.black, offset: Offset(0, -8))],
            fontSize: 25,
            color: Colors.transparent,
            decoration: TextDecoration.underline,
            decorationColor: Colors.tealAccent,
            decorationThickness: 2,
          )
              : GoogleFonts.roboto(fontSize: 20.0, color: Colors.black),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
class TabWebList extends StatefulWidget {
  const
  TabWebList({super.key});

  @override
  State<TabWebList> createState() => _TabWebListState();
}
class _TabWebListState extends State<TabWebList> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Spacer(flex: 3,),
        TabsWeb(title: "Home",route: "/",),
        Spacer(),
        TabsWeb(title: "Works",route: "/work",),
        Spacer(),
        TabsWeb(title: "About",route: "/about",),
        Spacer(),
        TabsWeb(title: "Blog",route: "/blog",),
        Spacer(),
        TabsWeb(title: "Contact",route: "/contact",),
        Spacer(),
      ],
    );
  }
}

class DrawerWeb extends StatelessWidget {
  const DrawerWeb({super.key});
  launcherUrl(String imagePath, String Url) {
    return IconButton(
      onPressed: () async {
        await launchUrl(Uri.parse(Url));
      },
      icon: SvgPicture.asset(imagePath, width: 35.0),
    );
  }
  @override
  Widget build(BuildContext context) {

    return  Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/mynew.png"),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          SansBold(text: "Muhammad Tahir", size: 30.0),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              launcherUrl(
                "assets/instagram.svg",
                "https://www.instagram.com/tahirappdev/",
              ),
              launcherUrl(
                "assets/linkdln.svg",
                "https://www.linkedin.com/in/mohammad-tahir-flutter/",
              ),
              launcherUrl(
                "assets/github.svg",
                "https://github.com/MuhammadTahir18/",
              ),
            ],
          ),
        ],
      ),
    );
  }
}


/////////////////////mobile ////////////
class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}
class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      elevation: 20.0,
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});
  launcherUrl(String imagePath, String Url) {
    return IconButton(
      onPressed: () async {
        await launchUrl(Uri.parse(Url));
      },
      icon: SvgPicture.asset(imagePath, width: 35.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
                image: DecorationImage(
                  image: AssetImage("assets/myp.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          TabsMobile(text: "Home", route: "/"),
          const SizedBox(height: 20.0),
          TabsMobile(text: "Works", route: "/works"),
          const SizedBox(height: 20.0),
          TabsMobile(text: "Blog", route: "/blog"),
          const SizedBox(height: 20.0),
          TabsMobile(text: "About", route: "/about"),
          const SizedBox(height: 20.0),
          TabsMobile(text: "Contact", route: "/contact"),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              launcherUrl(
                "assets/instagram.svg",
                "https://www.instagram.com/tahirappdev/",
              ),
              launcherUrl(
                "assets/linkdln.svg",
                "https://www.linkedin.com/in/mohammad-tahir-flutter/",
              ),
              launcherUrl(
                "assets/github.svg",
                "https://github.com/MuhammadTahir18/",
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class SansBold extends StatelessWidget {
  final text;
  final size;
  SansBold({super.key, required this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;
  Sans({super.key,required this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class TextForm extends StatelessWidget {
  final text;
  final hintText;
  final width;
  final maxLine;
  final controller;
  final validator;
  const TextForm({
    super.key,
    required this.text,
    required this.hintText,
    this.width,
    this.maxLine,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text: text, size: 16),
        SizedBox(height: 5),
        SizedBox(
          width: width,
          child: TextFormField(
            validator: validator,
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r"[a-zA-Z0-9 .,'@#\$%&*()_\-+=!?]")
              ),
            ],
            maxLines: maxLine == null ? null : maxLine,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              errorBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final fit;
  final text;
  final reverse;
  final height;
  final width;
  final color;

  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.fit,
     this.text,
    this.reverse,
    this.height,
    this.width,
    this.color,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 4),
  )..repeat(reverse: true);
  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: (_animation),
      child: Card(
        color: Colors.white,
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height==null?200:widget.height,
                width: widget.width==null?200:widget.width,
                fit: widget.fit == null ? null : widget.fit,

              ),
              SizedBox(height: 10),
              widget.text == null ? const SizedBox() : SansBold(text: widget.text),

            ],
          ),
        ),
      ),
    );
  }
}


class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom({
    super.key,
    required  this.text,
      this.size,
    this.color,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: GoogleFonts.abel(
      fontWeight: fontWeight==null?FontWeight.normal:fontWeight,
      fontSize: size,
      color: color==null?Colors.black:color
    ),);
  }
}



class AddDataFirestore{
  final logger=Logger();
   CollectionReference response=FirebaseFirestore.instance.collection("message");
   Future AddResponse(final firstname,final lastname,  final email, final phone,final message)async{
     return response.add({
       "FirstName":firstname,
       "LastName":lastname,
       "Email":email,
       "Phone":phone,
       "Message":message,
     }).then((value){
       logger.d("success");
       return true;
    }).catchError((error){
       logger.d(error);
     return false;
     });


   }
}

Future  DialogError(BuildContext context, String title){
  return   showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: SansBold(text: title,size: 20.0,),
  ));
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return  Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 30.0,),
          SansBold(text: "Contact me", size: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    controller: _firstNameController,
                    text: "First Name",
                    hintText: "please enter your first name",
                    maxLine: 1,
                    width: 350,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "first name  is required";
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextForm(
                    controller: _emailController,
                    text: "Email ",
                    hintText: "please enter your email ",
                    maxLine: 1,
                    width: 350,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "email  is required";
                      }
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  TextForm(
                    controller: _lastNameController,
                    text: "Last Name ",
                    hintText: "please enter your last name ",
                    maxLine: 1,
                    width: 350,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "last name  is required";
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  TextForm(
                    controller: _phoneController,
                    text: "Phone Number ",
                    hintText: "please enter your phone number ",
                    maxLine: 1,
                    width: 350,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "phone number  is required";
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          TextForm(
            controller: _messageController,
            text: "Message",
            hintText: "please type your message",
            maxLine: 10,
            width: devicewidth / 1.5,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "message  is required";
              }
            },
          ),
          SizedBox(height: 20.0,),
          MaterialButton(
            height: 60.0,
            elevation: 20.0,
            minWidth: 200.0,
            color: Colors.tealAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: ()async {
              final addData = AddDataFirestore();
              logger.d(_firstNameController.text);
              if (formkey.currentState!.validate()) {
                if (await addData.AddResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )){
                  formkey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                }
                else{
                  DialogError(context,"Message sent failed");
                }
              }
            },
            child: SansBold(text: "Submit", size: 20.0),
          ),
        ],
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold(text: "Contact me", size: 35.0),
          TextForm(
            controller: _firstNameController,
            text: "First Name",
            hintText: "please type first name",
            width: deviceWidth / 1.4,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return "first name is required";
              }
            },
          ),
          TextForm(
            controller: _lastNameController,
            text: "Last Name",
            hintText: "please type last name",
            width: deviceWidth / 1.4,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return "last name is required";
              }
            },
          ),
          TextForm(
            controller: _emailController,
            text: "Email",
            hintText: "please type email address",
            width: deviceWidth / 1.4,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return "email  is required";
              }
            },
          ),
          TextForm(
            controller: _phoneController,
            text: "Phone Number",
            hintText: "please type phone number",
            width: deviceWidth / 1.4,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return "phone number is required";
              }
            },
          ),
          TextForm(
            controller: _messageController,
            text: "Message",
            hintText: " message",
            width: deviceWidth / 1.4,
            maxLine: 10,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return "message  is required";
              }
            },
          ),
          MaterialButton(
            onPressed: () async {
              final addData = AddDataFirestore();
              logger.d(_firstNameController.text);
              if (formkey.currentState!.validate()) {
                if (await addData.AddResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formkey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message sent failed");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: deviceWidth / 2.2,
            color: Colors.tealAccent,
            child: SansBold(text: "Submit", size: 20.0),
          ),
        ],
      ),
    );
  }
}

Widget tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.tealAccent,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: const EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(fontSize: 15.0),
    ),
  );
}