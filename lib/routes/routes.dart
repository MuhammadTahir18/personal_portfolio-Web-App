import 'package:api_flutter/Mobile/about_mobile.dart';
import 'package:api_flutter/Mobile/contact_mobile.dart';
import 'package:api_flutter/Mobile/landing_page_mobile.dart';
import 'package:api_flutter/Mobile/works_mobile.dart';
import 'package:api_flutter/common/blog.dart';
import 'package:api_flutter/web/about_web.dart';
import 'package:api_flutter/web/contact_web.dart';
import 'package:api_flutter/web/landing_page_web.dart';
import 'package:api_flutter/web/works_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return LayoutBuilder(
              builder: (context, constrainst) {
                if (constrainst.maxWidth > 800) {
                  return LandingPageWeb();
                } else {
                  return LandingPageMobile();
                }
              },
            );
          },
        );
      case "/contact":
        return MaterialPageRoute(builder: (_)=>
            LayoutBuilder(builder: (context, constraints){
              if(constraints.maxWidth>800){
                return ContactWeb();
              }
              else{
                return ContactMobile();
              }
            }),
            settings: settings
        );
      case "/about":
        return MaterialPageRoute(builder: (_)=>
            LayoutBuilder(builder: (context, constraints){
              if(constraints.maxWidth>800){
                return AboutWeb();
              }
              else{
                return AboutMobile();
              }
            }),
            settings: settings
        );
      case "/works":
        return MaterialPageRoute(builder: (_)=>
            LayoutBuilder(builder: (context, constraints){
              if(constraints.maxWidth>800){
                return WorksWeb();
              }
              else{
                return WorksMobile();
              }
            }),
            settings: settings
        );
      case "/blog":
        return MaterialPageRoute(builder: (_)=>
            Blog(),
            settings: settings
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return LayoutBuilder(
              builder: (context, constrainst) {
                if (constrainst.maxWidth > 800) {
                  return LandingPageWeb();
                } else {
                  return LandingPageMobile();
                }
              },
            );
          },
        );
    }
  }
}
