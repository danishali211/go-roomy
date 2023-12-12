import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goroomy/Constants/colors.dart';
import 'package:goroomy/Custom/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../Custom/Button1.dart';
import '../../Custom/couraselslider.dart';
class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}
final List<String> imgList = [
  "assets/screen2-1.png",
      "assets/screeen3-1.png",
      "assets/screen4-1.png",
  ];
int _current = 1;
class _Screen2State extends State<Screen2> {

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
    !.map((item) => Container(
      child:
      Image.asset(
        item,
        fit: BoxFit.cover,
        // width: 300,
      ),
      // Positioned(
      //   bottom: 0.0,
      //   left: 0.0,
      //   right: 0.0,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           Color.fromARGB(200, 0, 0, 0),
      //           Color.fromARGB(0, 0, 0, 0),
      //         ],
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter,
      //       ),
      //     ),
      //     padding: EdgeInsets.symmetric(
      //       horizontal: 20,
      //       vertical: 10,
      //     ),
      //     child: Text(
      //       'No. ${widget.imgList!.indexOf(item)} image',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),

    ))
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text( 'How does this works?',
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Bluecolor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        // _current == widget!.imgList!.length ?  _current = 1 : _current++;
                        _current = index+1;
                      });
                      print('this is current$_current');
                    }),
              ),
              // SizedBox(
              //   height: 40,
              // ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 3,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Bluecolor

                              ),
                            ),
                            Text('${_current}', style: TextStyle(
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ]
                  ),
                  Text(_current==1?'Pick your location':_current == 2 ?'Select date and time slot': 'Select number of persons', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold,
                      color: Bluecolor

                  ),),

                  // _current == 2 ?   Text('Use the filters to find the experience you are looking for',
                  //       style: TextStyle(
                  //              fontSize: 12
                  //          ),
                  //          maxLines: 2,
                  //          textAlign: TextAlign.center,
                  //          overflow: TextOverflow.ellipsis,
                  //        ) : Container(),
                  // _current == 1 ? MyText(text: "Select a date", size: 16,fontWeight: FontWeight.bold,) : _current == 2 ?
                  //
                  //     MyText(text: "Find your dream hotel", size: 16,fontWeight: FontWeight.bold,)
                  //
                  //     Text('Use the filters to find the experience you are looking for',
                  //       style: TextStyle(
                  //           fontSize: 12
                  //       ),
                  //       maxLines: 2,
                  //       textAlign: TextAlign.center,
                  //       overflow: TextOverflow.ellipsis,
                  //     )
                  //
                  //  : Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 40),
                  //   child: Column(
                  //     // mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Text( "Book the time slot and make your selection",
                  //           maxLines: 2,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               fontSize:16,
                  //               fontWeight: FontWeight.bold
                  //           ),),
                  //       ]
                  //   ),
                  // ),
                  // Spacer(),
                  // SizedBox(
                  //     height: 50
                  // ),

                ],
              ),
             // Icon(Icons.calendar_month, size: 200,),
             //  CarouselWithDotsPage(imgList: imgList),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:imgList!.map((url) {
                        int index = imgList!.indexOf(url);
                        return Container(
                          width: 7,
                          height: 7,
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 3,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index+1
                                ? Color.fromRGBO(255, 195, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      children: [
                        Expanded(child: CustomButton(title: 'Continue', color1:Bluecolor,
                          textcolor: Colors.white,
                          onTap: (){
                            Navigator.pushNamed(context, 'screen3');
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
      ),
    );
  }
}
