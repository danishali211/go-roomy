import 'package:flutter/material.dart';
import 'package:goroomy/Routes/route_names.dart';
import 'package:goroomy/Screens/Home/home.dart';
import 'package:goroomy/Screens/initial/screen1.dart';
import 'package:goroomy/Screens/initial/screen2.dart';
import 'package:goroomy/Screens/initial/screen4.dart';
import 'package:goroomy/Screens/initial/screen5.dart';
import 'package:page_transition/page_transition.dart';

import '../Screens/initial/screen3.dart';
class Routes {
  static Route onGenerateRoutes(RouteSettings settings) {
    print('this is route${settings.name}');
    switch (settings.name) {
      case RoutesName.home:
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
        break;
      case RoutesName.screen1:
        return PageTransition(
          child: Screen1(),
          // alignment: Alignment.bottomRight,
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case RoutesName.screen2:
        return PageTransition(
          child: Screen2(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case RoutesName.screen3:
        return PageTransition(
          child: Screen3(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case RoutesName.screen4:
        return PageTransition(
          child: Screen4(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case RoutesName.screen5:
        return PageTransition(
          child: Screen5(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: ((context) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes Found"),
            ),
          );
        }));
    }
  }
}