import 'package:flutter/material.dart';
import 'package:goroomy/Constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
class HotelScreen extends StatefulWidget {
  String? Dateyime;
  String? cityName;
  // Receiving Data from previous screen
  HotelScreen({this.Dateyime,this.cityName});
  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late bool _loadingShimmer;

  @override
  void initState() {
    _loadingShimmer = true;
    Future.delayed(const Duration(seconds: 3), (){
      setState(() {
        _loadingShimmer = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(AppBar().preferredSize.height),
      body: _loadingShimmer ?
    Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.sort, color: Colors.grey,),
                                onPressed: (){
                                  print('back icon button');
                                }, ),
                              Text('Sort',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.filter, color: Colors.grey,),
                                onPressed: (){
                                  print('back icon button');
                                }, ),
                              Text('Filter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.map_outlined, color: Colors.grey,),
                                onPressed: (){
                                  print('back icon button');
                                }, ),
                              Text('Map',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                   height: 6,
                 ),
                 Container(
                   width: screenSize.width,
                   color: Colors.white,
                   child: Text('21345'),
                ),
                Column(
                  children: [
                    Container(
                      // List showing Hotels
                      child: ListView.separated(
                          physics: const ScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            // Card Widget
                            return HotelCard(
                               context, index , 'Helo'
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ) :  SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: Column(
    children: [
    Container(
    width: screenSize.width,
    height: screenSize.height * 0.07,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12)),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    child: Center(
    child: Row(
    children: [
    IconButton(icon: Icon(Icons.sort, color: Colors.grey,),
    onPressed: (){
    print('back icon button');
    }, ),
    Text('Sort',
    style: TextStyle(
    color: Colors.black,
    fontSize: 12
    ),
    ),
    ],
    ),
    ),
    ),
    Container(
    child: Center(
    child: Row(
    children: [
    IconButton(icon: Icon(Icons.filter, color: Colors.grey,),
    onPressed: (){
    print('back icon button');
    }, ),
    Text('Filter',
    style: TextStyle(
    color: Colors.black,
    fontSize: 12
    ),
    ),

    ],
    ),
    ),
    ),
    Container(
    child: Center(
    child: Row(
    children: [
    IconButton(icon: Icon(Icons.map_outlined, color: Colors.grey,),
    onPressed: (){
    print('back icon button');
    }, ),
    Text('Map',
    style: TextStyle(
    color: Colors.black,
    fontSize: 12
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    SizedBox(
    height: 6,
    ),
    Container(
    width: screenSize.width,
    color: Colors.white,
    child: Text('21345'),
    ),
    Column(
    children: [
    Container(
    // List showing Hotels
    child: ListView.separated(
    physics: const ScrollPhysics(),
    separatorBuilder: (context, index) {
    return Divider();
    },
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
    // Card Widget
    return HotelCard(
    context, index , 'Helo'
    );
    }),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    );
  }

  Widget HotelCard(BuildContext context,int index,String name,){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
               Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                    borderRadius: BorderRadius.circular(8)
                  ),
                 constraints: BoxConstraints(
                     maxHeight: MediaQuery.of(context).size.height * 0.25,
                   minWidth: MediaQuery.of(context).size.width * 0.20,
                   maxWidth: MediaQuery.of(context).size.width * 0.20,
                 ),
                  child:
                  CachedNetworkImage(
                    imageUrl: 'http://via.placeholder.com/350x150',
                    placeholder: (context,url) => CircularProgressIndicator(),
                    errorWidget: (context,url,error) => new Icon(Icons.error),
                  ),
                ),

           SizedBox(
             width: 6,
           ),
             Expanded(
               child: Column(
                      children: [
                           Container(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Park Lane Hotel Lahore'),
                                    // SizedBox(
                                    //   width:MediaQuery.of(context).size.width *0.27,
                                    // ),
                                     Icon(Icons.heart_broken),
                                  ],
                                ),
                           ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating: 2.75,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                // size: 12,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Bluecolor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text('Genius', style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                                ),),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Bluecolor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text('8.5', style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                ),),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Very Good'),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)
                                ),

                              ),
                            ),
                            Text('2208 reviews'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 3,
                            ),
                            Text('Gulberg'),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 3,
                                width: 3,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)
                                ),

                              ),
                            ),
                            Text('4.3 miles from center'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              padding: EdgeInsets.all(2),
                              child: Text('Mobile-only price', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Hotel Room: 1 bed')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Price for 1 night, 2 adults')
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Text(
                                  'PKR 22,000',
                                  style: TextStyle(
                                    color: Colors.red, // Text color
                                  ),
                                ),
                                Positioned(
                                  top: 10.0, // Adjust the position of the line
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    height: 1.0, // Adjust the thickness of the line
                                    color: Colors.red, // Color of the line
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('PKR 17,028', style: TextStyle(
                              fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('+PKR 17,028 taxes and fees', style: TextStyle(

                                color: Colors.black),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.done, color: Colors.green,size: 20,),
                            Text('Free cancellation', style: TextStyle(
                              fontWeight: FontWeight.bold,
                                color: Colors.green),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.done, color: Colors.green,size: 20,),
                            Text('No prepayment needed', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),)
                          ],
                        ),
                      ],
                    ),
             ),
            ],
      ),

    );
  }
  _appBar(height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+80 ),
    child: Stack(
      children: <Widget>[
        Container(     // Background
          color:Bluecolor,
          height: height+75,
          width: MediaQuery.of(context).size.width,
        ),

        Container(),   // Required some widget in between to float AppBar

        Positioned(    // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            toolbarHeight: 50,
            shape:ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.amber, width: 3.0),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: (){
                Navigator.pop(context);
                print('back icon button');
              }
              ,),
            primary: false,
            title: TextField(
              readOnly: true,
                decoration: InputDecoration(
                    hintText: "${widget.cityName} ~ ${widget.Dateyime}",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
          ),
        )

      ],
    ),
  );
}
