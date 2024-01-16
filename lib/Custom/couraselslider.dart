// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:goroomy/Constants/colors.dart';
// import 'package:goroomy/Custom/text.dart';
//
// class CarouselWithDotsPage extends StatefulWidget {
//   List<String>? imgList;
//
//   CarouselWithDotsPage({this.imgList});
//
//   @override
//   _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
// }
//
// class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
//   int _current = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> imageSliders = widget.imgList!
//         .map((item) => Container(
//               child: Image.asset(
//                 item,
//                 fit: BoxFit.fill,
//                 width: 1000,
//               ),
//             ))
//         .toList();
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CarouselSlider(
//           items: imageSliders,
//           options: CarouselOptions(
//               autoPlay: true,
//               // enlargeCenterPage: true,
//               aspectRatio: 2.0,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index + 1;
//                 });
//                 print('this is current$_current');
//               }),
//         ),
//         SizedBox(
//           height: 40,
//         ),
//         Column(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: 20,
//                     height: 20,
//                     margin: EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 3,
//                     ),
//                     decoration:
//                         BoxDecoration(shape: BoxShape.circle, color: Bluecolor),
//                   ),
//                   Text(
//                     '${_current}',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ]),
//             Text(
//               _current == 1
//                   ? 'Pick your location'
//                   : _current == 2
//                       ? 'Select date and time slot'
//                       : 'Select number of persons',
//               style: TextStyle(
//                   fontSize: 16, fontWeight: FontWeight.bold, color: Bluecolor),
//             ),
//             SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: widget.imgList!.map((url) {
//                 int index = widget.imgList!.indexOf(url);
//                 return Container(
//                   width: 7,
//                   height: 7,
//                   margin: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 3,
//                   ),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: _current == index + 1
//                         ? Color.fromRGBO(255, 195, 0, 0.9)
//                         : Color.fromRGBO(0, 0, 0, 0.4),
//                   ),
//                 );
//               }).toList(),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
