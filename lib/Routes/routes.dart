import 'package:flutter/material.dart';
import 'package:goroomy/Routes/route_names.dart';
import 'package:goroomy/Screens/Home/home.dart';
import 'package:goroomy/Screens/Hotelscreens/hotels.dart';
import 'package:goroomy/Screens/initial/screen1.dart';
import 'package:goroomy/Screens/initial/screen2.dart';
import 'package:goroomy/Screens/initial/screen4.dart';
import 'package:goroomy/Screens/initial/screen5.dart';
import 'package:page_transition/page_transition.dart';
import '../Screens/initial/screen3.dart';
import '../Screens/initial/screen6.dart';
// Routes class for Navigation
class Routes {
  static Route onGenerateRoutes(RouteSettings settings) {
    final args = settings.arguments as Map<String,dynamic>?;
    print('this is args ${args}');
    print('this is route${settings.name}');
    switch (settings.name) {
      case RoutesName.home:
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
        );
        break;
      case RoutesName.screen1:
        return PageTransition(
          child: Screen1(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          duration: Duration( milliseconds: 500)
        );
      case RoutesName.screen2:
        return PageTransition(
          child: Screen2(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
        );
      case RoutesName.screen3:
        return PageTransition(
          child: Screen3(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
        );
      case RoutesName.screen4:
        return PageTransition(
          child: Screen4(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
        );
      case RoutesName.screen5:
        return PageTransition(
          child: Screen5(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
        );
      case RoutesName.screen6:
        return PageTransition(
          child: LastScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
        );
      case RoutesName.hotelList:
        // Data on next screen
        Map parms = args!;
        print('this is parms${parms}');
        return PageTransition(
          child: HotelScreen(Dateyime:parms["Dateyime"] ?? "",
          cityName: parms?['city'],),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
            duration: Duration( milliseconds: 500)
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
