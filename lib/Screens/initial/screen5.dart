import 'package:flutter/material.dart';
import 'package:goroomy/Constants/colors.dart';

import '../../Custom/Button1.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  Widget iconWithText(String text1, path) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 12,
        ),
        Image.asset(
          path,
          fit: BoxFit.cover,
          width: 36,
          height: 36,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text1,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Bluecolor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  '     Freedom.\n     Flexibility. \n Peace of mind.',
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold, color: Bluecolor),
                ),
              ),
              iconWithText('Free Cancellation', 'assets/screen5-1.png'),
              iconWithText('Cheap rates', 'assets/screen5-2.png'),
              iconWithText('Pay at the hotel', 'assets/screen5-3.png'),
              iconWithText('World leader', 'assets/screen5-4.png'),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                        title: 'Continue',
                        color1: Bluecolor,
                        textcolor: Colors.white,
                        onTap: () {
                          Navigator.pushNamed(context, 'home_screen');
                        },
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
