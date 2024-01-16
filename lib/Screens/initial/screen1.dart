import 'package:flutter/material.dart';
import 'package:goroomy/Constants/colors.dart';

import '../../Custom/Button1.dart';
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 250,
              color: Colors.amber,
              child:Image(image: AssetImage("assets/screen1.jpg"))
            ),
            SizedBox(
              height: 50,
            ),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal:40),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text( 'Experience the day time\n hotel experience at\n affordable rates!',
                   maxLines: 3,
               textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Bluecolor,
                   fontWeight: FontWeight.bold,
                   fontSize: 30,
                   overflow: TextOverflow.ellipsis,
                 ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Text('Whether alone or with a partner, enjoy a hotel room during the day or evening for a few hours. Simply choose your time slot.'),
                 SizedBox(
                   height: 20,
                 ),
                 Row(
                   children: [
                     Expanded(child: CustomButton(title: 'Skip Intro', color1: Colors.grey,
                       textcolor: Colors.black,
                       onTap: (){
                         Navigator.pushNamed(context, 'home_screen');
                       },
                     )),
                   ],
                 ),
                SizedBox(
                  height: 20,
                ),
                 Row(
                   children: [
                     Expanded(child: CustomButton(title: 'Continue', color1: Bluecolor,
                       textcolor: Colors.white,
                       onTap: (){
                       Navigator.pushNamed(context, 'screen2');
                       },
                     )),
                   ],
                 ),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}

