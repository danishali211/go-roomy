import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({this.height,this.width,required this.title,this.onTap,this.color1, this.textcolor});
  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  Color? color1;
  Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * 0.82,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          primary: color1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child:  Text(title , style: TextStyle(
          color:textcolor
        ),),
      ),
    );
    //   Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: InkWell(
    //     onTap: onTap,
    //     child: Container(
    //       height: height,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: color,
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       child: loading ? Center(child: CircularProgressIndicator(color: Colors.white,)) :Center(
    //         child: Text(
    //           title,
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}