import 'package:flutter/material.dart';
class MyText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  const MyText({
    @required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
  });
  // const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
        wordSpacing: wordSpacing,
    ),
    );
  }
}
