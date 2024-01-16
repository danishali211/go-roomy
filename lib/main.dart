import 'package:flutter/material.dart';
import 'Routes/route_names.dart';
import 'Routes/routes.dart';
import 'Screens/initial/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerateRoutes,
      initialRoute: RoutesName.screen1,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Screen1(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
