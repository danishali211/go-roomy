import 'package:flutter/material.dart';
import 'package:goroomy/Custom/text.dart';

import '../../Constants/colors.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      print('Navigating to Home');
                      Navigator.pushNamed(context, 'home_screen');
                    },
                    child: Container(
                        height: height * 0.29,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                            color: beachColor,
                            border: Border.all(
                              width: 1,
                            )),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: 'Find Hotel',
                                    color: Bluecolor,
                                    fontWeight: FontWeight.w500,
                                    size: 24,
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/hotel.png',
                                    height: 90,
                                    width: 90,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: height * 0.14,
                          width: width * 0.37,
                          decoration: BoxDecoration(
                              color: orangeColor,
                              border: Border.all(
                                width: 1,
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'My Bookings',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      size: 18,
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/online-booking.png',
                                      height: 50,
                                      width: 50,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                          height: height * 0.14,
                          width: width * 0.37,
                          decoration: BoxDecoration(
                              color: greenColor,
                              border: Border.all(
                                width: 1,
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Travel Guide',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      size: 18,
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/tourist.png',
                                      height: 50,
                                      width: 50,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Welcome packs for new users !',
                    size: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: height * 0.12,

                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                width: width * 0.48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child:
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/coupon.png',
                                                height: 20,
                                                width: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              MyText(text: '10% off', size: 16, fontWeight: FontWeight.w700,)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                              child: Text('First time booking', style: TextStyle(fontSize: 12)),
                                            ),
                                            // Optional: Add additional content as needed
                                          ],
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(7, 15, 0, 0),
                                      child: SizedBox(
                                        width: 30, // Adjust the width as needed
                                        child: Image.asset('assets/cart.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 20,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/top-rated.png', height: 30, width: 30,),
                  MyText(
                    text: 'Top Picks!',
                    size: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: height * 0.23,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                                // height: height * 0.35,
                                width: 150,
                                decoration: BoxDecoration(
                                  // color: Colors.deepOrange,
                                  // borderRadius: BorderRadius.all(Radius.circular(12)),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child:
                                Container(
                                  width: double.infinity,
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                  ),
                                  child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Image.asset('assets/screen1.jpg',),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                child: Text('First time booking', style: TextStyle(fontSize: 12,
                                                fontWeight: FontWeight.bold),),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 05,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                child: Text('PKR 1,500', style: TextStyle(fontSize: 12,
                                                    ),),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
