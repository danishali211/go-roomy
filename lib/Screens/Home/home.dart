import 'package:flutter/material.dart';
import 'package:goroomy/Constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
var userLat;
var userLng;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _currentPlaceController = TextEditingController();
  bool field = true;
  List<LatLng> polylineCoordinates = [];
  LocationPermission? permission;
  Position? _curentPosition;
  String? _curentAddress;
  int Rooms = 0;
  int Children = 0;
  int Adult = 0;
  String? cityName;
  var selectedLat;
  var selectedLng;
  String? selectedDatewithoutTime2;
  String? selectedDatewithoutTime;
  final List<String> cityItems = [
    'Lahore',
    'Islamabad',
    'Karachi',
    'Multan',
  ];
  DateTime? selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  dynamic? selectedValue;
  final formmater = DateFormat.yMd();
  // void _datePicker() async {
  //   final now = DateTime.now();
  //   final first = DateTime(now.year, now.month, now.day);
  //   final pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: first,
  //     lastDate: DateTime(now.year + 1, now.month, now.day),
  //   );
  //
  //   if (pickedDate != null && pickedDate.isAfter(now)) {
  //     setState(() {
  //       selectedDate = pickedDate;
  //       selectedDatewithoutTime =
  //       '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}';
  //     });
  //     print(
  //         'Selected Date: ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}');
  //   } else {
  //     print('Invalid or earlier date selected.');
  //   }
  // }
  //
  // Future<void> _selectTime(BuildContext context) async {
  //   print('In time picker');
  //   final TimeOfDay? picked_s = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     builder: (BuildContext? context, Widget? child) {
  //       return MediaQuery(
  //         data:
  //         MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (picked_s != null &&
  //       _convertToDateTime(picked_s).isAfter(DateTime.now()) &&
  //       picked_s != selectedTime) {
  //     setState(() {
  //       selectedTime = picked_s;
  //     });
  //   } else {
  //     print('Invalid or earlier time selected.');
  //   }
  // }
  //
  // DateTime _convertToDateTime(TimeOfDay time) {
  //   final now = DateTime.now();
  //   return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  // }
  void _datePicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year, now.month, now.day);
    print('this is first ${first}');
    setState(() {
      selectedDatewithoutTime2  = '${first!.day}-${first!.month}-${first!.year}';
      print('Newselected Date ${selectedDatewithoutTime2}');
    });
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: first,
        lastDate: DateTime(now.year + 1, now.day));
    setState(() {
      selectedDate = pickedDate;
      selectedDatewithoutTime = '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}';
    });
    print('this is selectedDate ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}');
  }
  //
  Future<void> _selectTime(BuildContext context) async {
    final now = DateTime.now();
    final first = DateTime(now.year, now.month, now.day);
    print('this is first ${first}');
    setState(() {
      selectedDatewithoutTime2 = '${first.day}-${first.month}-${first.year}';
      print('New selected Date ${selectedDatewithoutTime2}');
    });
    print('In time picker');
    final TimeOfDay? picked_s = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext? context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (selectedDate == null) {
      Fluttertoast.showToast(
        msg: 'Select Date First',
        backgroundColor: Bluecolor,
      );
    } else {
      if (picked_s != null) {
        final selectedDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          picked_s.hour,
          picked_s.minute,
        );

        if (selectedDateTime.isAfter(now) ||
            selectedDatewithoutTime != selectedDatewithoutTime2) {
          setState(() {
            selectedTime = picked_s;
          });
        }else{
          Fluttertoast.showToast(
            msg: 'Select Valid Time',
            backgroundColor: Bluecolor,
          );
          setState(() {
            selectedTime = TimeOfDay.now();
          });
        }
      }
    }
  }
  // Future<void> _selectTime(BuildContext context) async {
  //   final now = DateTime.now();
  //   final first = DateTime(now.year, now.month, now.day);
  //   print('this is first ${first}');
  //   setState(() {
  //     selectedDatewithoutTime2 = '${first!.day}-${first!.month}-${first!.year}';
  //     print('Newselected Date ${selectedDatewithoutTime2}');
  //   });
  //   print('In time picker');
  //   final TimeOfDay? picked_s = await showTimePicker(
  //       context: context,
  //       initialTime: selectedTime,
  //       builder: (BuildContext? context, Widget? child) {
  //         return MediaQuery(
  //           data:
  //           MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
  //           child: child!,
  //         );
  //       });
  //
  //   if (picked_s != null && picked_s != selectedTime &&
  //       selectedDatewithoutTime != selectedDatewithoutTime2) {
  //     setState(() {
  //       selectedTime = picked_s;
  //     });
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: 'Kindly Select valid date', backgroundColor: Bluecolor);
  //   }
  // }

  Future _getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      await Geolocator.openLocationSettings();
      Fluttertoast.showToast(msg: "Location permissions are  denind");
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg: "Location permissions are permanently denind");
      }
    }
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _curentPosition = position;
        print(_curentPosition!.latitude);
        userLat = _curentPosition!.latitude;
        userLng = _curentPosition!.longitude;
        print('+++${userLat} ${userLng}');
        LatLng currentLatLong = LatLng(userLat, userLng);
        // _getAddressFromLatLon();
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  _getAddressFromLatLon() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _curentPosition!.latitude, _curentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {
        _curentAddress =
        "${place.locality},${place.subLocality},${place.street}";
        _currentPlaceController.text = _curentAddress!;
        // cityName = '${place.locality}, ${place.country}';
        print('this is current location$_curentAddress');
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      Adult = 1;
      Rooms =1;
    });
    super.initState();
  }
  // -----
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Bluecolor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Goroomy.com',
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Manrope"),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ImageIcon(
                AssetImage('assets/home-1.png',),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: width,
              height: height * 0.13,
              color: Colors.blueGrey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: Column(
                  children: [
                    Text(
                        'Book rooms for shorter, cheaper stays that are overnight.'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Spacer(),
                        InkWell(
                          child: Text(
                            'Learnmore..',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: height * 0.5,
              width: width * 0.94,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.orange),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 25,
                            child: Image.asset(
                              'assets/home-2.png',
                            ),
                          ),
                        ),
                      ),
                      hint: const Text(
                        'City',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: cityItems
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select City.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          cityName = value;
                        });
                        print('this is SelectedValue ${cityName}');
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              _datePicker();
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Image.asset(
                                        'assets/home-4.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(selectedDate == null
                                        ? 'Date'
                                        : formmater.format(selectedDate!))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              print('Selecting time');
                              _selectTime(context);
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Image.asset(
                                        'assets/home-5.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(selectedTime == null
                                        ? 'Time'
                                        : '${selectedTime.hour} : ${selectedTime
                                        .minute}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // For showing modal bottom sheet
                        showSheet(context);
                      },
                      child: Container(
                        width: width * 0.82,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    'assets/home-6.png',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('rooms:${Rooms} adults: ${Adult}, children: ${Children}'),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: width * 0.82,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(cityName=="" || cityName == null || selectedDate == null || Rooms == null || Rooms == 0 ){
                          Fluttertoast.showToast(
                              msg: "Fields cannot be empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              // timeInSecForIosWeb: 1,
                              backgroundColor: Bluecolor,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }else{
                          Navigator.pushNamed(context, 'hotel_list_screen', arguments: {
                            'Dateyime': selectedDatewithoutTime.toString(),
                            'city': cityName.toString()
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Bluecolor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
  void showSheet(context) {
    var height = MediaQuery.of(context).size.height;

    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter ModalsetState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            height: height * 0.4, // Adjusted height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: Text(
                    "Rooms",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.hotel,
                    color: Bluecolor,
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          ModalsetState(() {
                            Rooms++;
                          });
                          print('Rooms ${Rooms}');
                        },
                        icon: Icon(Icons.add),
                        color: Bluecolor,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          '$Rooms',
                          style: TextStyle(fontSize: 18, color: Bluecolor, fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (Rooms > 1) {
                            ModalsetState(() {
                              Rooms--;
                            });
                            print('Rooms ${Rooms}');
                          }
                        },
                        icon: Icon(Icons.remove),
                        color: Rooms <= 1 ? Colors.grey : Bluecolor,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    "Adults",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.person,
                    color:Bluecolor,
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          ModalsetState(() {
                            Adult++;
                          });
                          print('Adults ${Adult}');
                        },
                        icon: Icon(Icons.add),
                        color: Bluecolor,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          '$Adult',
                          style: TextStyle(fontSize: 18, color: Bluecolor, fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (Adult > 1) {
                            ModalsetState(() {
                              Adult--;
                            });
                            print('Adults ${Adult}');
                          }
                        },
                        icon: Icon(Icons.remove),
                        color: Adult <= 1 ? Colors.grey : Bluecolor,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    "Children",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.child_care,
                    color: Bluecolor,
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          ModalsetState(() {
                            Children++;
                          });
                          print('Children ${Children}');
                        },
                        icon: Icon(Icons.add),
                        color: Bluecolor,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          '$Children',
                          style: TextStyle(fontSize: 18, color: Bluecolor, fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (Children > 0) {
                            ModalsetState(() {
                              Children--;
                            });
                            print('Children ${Children}');
                          }
                        },
                        icon: Icon(Icons.remove),
                        color: Children <= 0 ? Colors.grey : Bluecolor,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text('Select', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Bluecolor,
                    elevation: 8.0, // Increased elevation
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

// void showSheet(context) {
  //   var height = MediaQuery.of(context).size.height;
  //
  //   showModalBottomSheet(context: context, builder: (BuildContext bc) {
  //     return StatefulBuilder(
  //       builder: (BuildContext context, StateSetter ModalsetState) {
  //         return Container(
  //           padding: EdgeInsets.all(16.0),
  //           height: height * 0.7, // Adjusted height
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               buildListTile("Rooms", Icons.hotel, Rooms, () {
  //                 ModalsetState(() {
  //                   Rooms++;
  //                 });
  //                 print('Rooms ${Rooms}');
  //               }, () {
  //                 if (Rooms > 1) {
  //                   ModalsetState(() {
  //                     Rooms--;
  //                   });
  //                   print('Rooms ${Rooms}');
  //                 }
  //               }),
  //               buildListTile("Adults", Icons.person, Adult, () {
  //                 ModalsetState(() {
  //                   Adult++;
  //                 });
  //                 print('Adults ${Adult}');
  //               }, () {
  //                 if (Adult > 1) {
  //                   ModalsetState(() {
  //                     Adult--;
  //                   });
  //                   print('Adults ${Adult}');
  //                 }
  //               }),
  //               buildListTile("Children", Icons.child_care, Children, addFunction() {
  //                 ModalsetState(() {
  //                   Children++;
  //                 });
  //                 print('Children ${Children}');
  //               }, () {
  //                 if (Children > 0) {
  //                   ModalsetState(() {
  //                     Children--;
  //                   });
  //                   print('Children ${Children}');
  //                 }
  //               }),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   setState(() {});
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text('Select', style: TextStyle(color: Colors.white)),
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.blue,
  //                   elevation: 8.0, // Increased elevation
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   });
  // }
  //
  // Widget buildListTile(String title, IconData icon, int value, Function? addFunction, Function? removeFunction) {
  //   return ListTile(
  //     title: Text(
  //       title,
  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //     ),
  //     leading: Icon(
  //       icon,
  //       color: Colors.blue,
  //     ),
  //     trailing: Wrap(
  //       spacing: 12,
  //       children: <Widget>[
  //         IconButton(
  //           onPressed: addFunction,
  //           icon: Icon(Icons.add),
  //           color: Colors.blue,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
  //           child: Text(
  //             '$value',
  //             style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //         IconButton(
  //           onPressed: removeFunction,
  //           icon: Icon(Icons.remove),
  //           color: value <= 1 ? Colors.grey : Colors.blue,
  //         ),
  //       ],
  //     ),
  //   );
  // }

// void showSheet(context) {
  //   var height = MediaQuery
  //       .of(context)
  //       .size
  //       .height;
  //
  //   // Show a modal bottom sheet with the specified context and builder method.
  //   showModalBottomSheet(context: context, builder: (BuildContext bc) {
  //     return StatefulBuilder(
  //       builder: (BuildContext context, StateSetter ModalsetState) {
  //         print('Stateful builder settt');
  //         return Container(
  //           height: height * 0.6, // Adjusted height
  //           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24), // Added padding
  //
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               ListTile(
  //                 title: Text("Rooms"),
  //                 trailing: Wrap(
  //                   spacing: 12,
  //                   children: <Widget>[
  //                     IconButton(onPressed: () {
  //                       ModalsetState(() {
  //                         Rooms++;
  //                       });
  //                       print('Rooms ${Rooms}');
  //                     }, icon: Icon(Icons.add)),
  //                     Padding(
  //                       padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
  //                       child: Text(
  //                         '${Rooms}',
  //                         style: TextStyle(
  //                             fontSize: 18,
  //                             color: Bluecolor,
  //                             fontWeight: FontWeight.w500
  //                         ),
  //                       ),
  //                     ),
  //                     IconButton(onPressed: Rooms == 1 ? () {} : () {
  //                       ModalsetState(() {
  //                         Rooms--;
  //                       });
  //                       print('Rooms ${Rooms}');
  //                     }, icon: Icon(Icons.remove)),
  //                   ],
  //                 ),
  //               ),
  //               ListTile(
  //                 title: Text("Adults"),
  //                 trailing: Wrap(
  //                   spacing: 12,
  //                   children: <Widget>[
  //                     IconButton(onPressed: () {
  //                       ModalsetState(() {
  //                         Adult++;
  //                       });
  //                       print('adult ${Adult}');
  //                     }, icon: Icon(Icons.add)),
  //                     Padding(
  //                       padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
  //                       child: Text(
  //                         '${Adult}',
  //                         style: TextStyle(
  //                             fontSize: 18,
  //                             color: Bluecolor,
  //                             fontWeight: FontWeight.w500
  //                         ),
  //                       ),
  //                     ),
  //                     IconButton(onPressed: Adult == 1 ? () {} : () {
  //                       ModalsetState(() {
  //                         Adult--;
  //                       });
  //                       print('adult ${Adult}');
  //                     }, icon: Icon(Icons.remove)),
  //                   ],
  //                 ),
  //               ),
  //               ListTile(
  //                 title: Text("Children"),
  //                 trailing: Wrap(
  //                   spacing: 12,
  //                   children: <Widget>[
  //                     IconButton(onPressed: () {
  //                       ModalsetState(() {
  //                         Children++;
  //                       });
  //                       print('children ${Children}');
  //                     }, icon: Icon(Icons.add)),
  //                     Padding(
  //                       padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
  //                       child: Text(
  //                         '${Children}',
  //                         style: TextStyle(
  //                             fontSize: 18,
  //                             color: Bluecolor,
  //                             fontWeight: FontWeight.w500
  //                         ),
  //                       ),
  //                     ),
  //                     IconButton(
  //                         onPressed: Children == 0 ? () {} : () {
  //                           ModalsetState(() {
  //                             Children--;
  //                           });
  //                           print('children ${Children}');
  //                         },
  //                         icon: Icon(Icons.remove)),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(height: 16), // Adjusted spacing
  //               ElevatedButton(
  //                 onPressed: () {
  //                   setState(() {});
  //                   Navigator.pop(context);
  //                 },
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 16), // Extended button height
  //                   child: Text(
  //                     'Select',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18, // Adjusted font size
  //                     ),
  //                   ),
  //                 ),
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Bluecolor,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20), // Rounded edges
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   });
  // }

//   void showSheet(context) {
//     var height = MediaQuery
//         .of(context)
//         .size
//         .height;
//
//     // Show a modal bottom sheet with the specified context and builder method.
//     showModalBottomSheet(context: context, builder: (BuildContext bc) {
//       return StatefulBuilder(
//         builder: (BuildContext context, StateSetter ModalsetState) {
//           print('Stateful builder settt');
//           return Container(
//             height: height * 0.6, // Adjusted height
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24), // Added padding
//
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ListTile(
//                   title: Text("Rooms"),
//                   trailing: Wrap(
//                     spacing: 12,
//                     children: <Widget>[
//                       IconButton(onPressed: () {
//                         ModalsetState(() {
//                           Rooms++;
//                         });
//                         print('Rooms ${Rooms}');
//                       }, icon: Icon(Icons.add)),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Text(
//                           '${Rooms}',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Bluecolor,
//                               fontWeight: FontWeight.w500
//                           ),
//                         ),
//                       ),
//                       IconButton(onPressed: Rooms == 1 ? () {} : () {
//                         ModalsetState(() {
//                           Rooms--;
//                         });
//                         print('Rooms ${Rooms}');
//                       }, icon: Icon(Icons.remove)),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("Adults"),
//                   trailing: Wrap(
//                     spacing: 12,
//                     children: <Widget>[
//                       IconButton(onPressed: () {
//                         ModalsetState(() {
//                           Adult++;
//                         });
//                         print('adult ${Adult}');
//                       }, icon: Icon(Icons.add)),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Text(
//                           '${Adult}',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Bluecolor,
//                               fontWeight: FontWeight.w500
//                           ),
//                         ),
//                       ),
//                       IconButton(onPressed: Adult == 1 ? () {} : () {
//                         ModalsetState(() {
//                           Adult--;
//                         });
//                         print('adult ${Adult}');
//                       }, icon: Icon(Icons.remove)),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("Children"),
//                   trailing: Wrap(
//                     spacing: 12,
//                     children: <Widget>[
//                       IconButton(onPressed: () {
//                         ModalsetState(() {
//                           Children++;
//                         });
//                         print('children ${Children}');
//                       }, icon: Icon(Icons.add)),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Text(
//                           '${Children}',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Bluecolor,
//                               fontWeight: FontWeight.w500
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: Children == 0 ? () {} : () {
//                             ModalsetState(() {
//                               Children--;
//                             });
//                             print('children ${Children}');
//                           },
//                           icon: Icon(Icons.remove)),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16), // Adjusted spacing
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {});
//                     Navigator.pop(context);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16), // Extended button height
//                     child: Text(
//                       'Select',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18, // Adjusted font size
//                       ),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Bluecolor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8), // Adjusted button border radius
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }
//
// // void showSheet(context) {
//   //   var height = MediaQuery.of(context).size.height;
//   //
//   //   // Show a modal bottom sheet with the specified context and builder method.
//   //   showModalBottomSheet(context: context, builder: (BuildContext bc) {
//   //     return StatefulBuilder(
//   //       builder: (BuildContext context, StateSetter ModalsetState) {
//   //         print('Stateful builder settt');
//   //         return Container(
//   //           height: height * 0.5,
//   //           padding: EdgeInsets.all(16), // Added padding to the container
//   //
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted spacing
//   //             children: [
//   //               buildRow("Rooms", Rooms, () {
//   //                 ModalsetState(() {
//   //                   Rooms++;
//   //                 });
//   //                 print('Rooms ${Rooms}');
//   //               }, () {
//   //                 if (Rooms > 1) {
//   //                   ModalsetState(() {
//   //                     Rooms--;
//   //                   });
//   //                   print('Rooms ${Rooms}');
//   //                 }
//   //               }),
//   //               buildRow("Adults", Adult, () {
//   //                 ModalsetState(() {
//   //                   Adult++;
//   //                 });
//   //                 print('adult ${Adult}');
//   //               }, () {
//   //                 if (Adult > 1) {
//   //                   ModalsetState(() {
//   //                     Adult--;
//   //                   });
//   //                   print('adult ${Adult}');
//   //                 }
//   //               }),
//   //               buildRow("Children", Children, () {
//   //                 ModalsetState(() {
//   //                   Children++;
//   //                 });
//   //                 print('children ${Children}');
//   //               }, () {
//   //                 if (Children > 0) {
//   //                   ModalsetState(() {
//   //                     Children--;
//   //                   });
//   //                   print('children ${Children}');
//   //                 }
//   //               }),
//   //               ElevatedButton(
//   //                 onPressed: () {
//   //                   setState(() {});
//   //                   Navigator.pop(context);
//   //                 },
//   //                 child: Text(
//   //                   'Select',
//   //                   style: TextStyle(color: Colors.white),
//   //                 ),
//   //                 style: ElevatedButton.styleFrom(
//   //                   backgroundColor: Bluecolor,
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       },
//   //     );
//   //   });
//   // }
//   //
//   // Widget buildRow(String title, int value, Function() onAdd, Function() onRemove) {
//   //   return ListTile(
//   //     title: Text(title),
//   //     trailing: Wrap(
//   //       spacing: 12, // space between two icons
//   //       children: <Widget>[
//   //         IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
//   //         Padding(
//   //           padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//   //           child: Text(
//   //             '$value',
//   //             style: TextStyle(fontSize: 18, color: Bluecolor, fontWeight: FontWeight.w500),
//   //           ),
//   //         ),
//   //         IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
//   //       ],
//   //     ),
//   //   );
//   // }
//
// void showSheet(context) {
//     var height = MediaQuery
//         .of(context)
//         .size
//         .height;
//     // Show a modal bottom sheet with the specified context and builder method.
//     showModalBottomSheet(context: context, builder: (BuildContext bc) {
//       return StatefulBuilder(
//         builder: (BuildContext context, StateSetter ModalsetState ) {
//           print('Stateful builder settt');
//           return Container(
//             height: height * 0.5,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ListTile(
//                   // leading: Text('1'),
//                   title: Text("Rooms"),
//                   trailing: Wrap(
//                     spacing: 12, // space between two icons
//                     children: <Widget>[
//                       IconButton(onPressed: () {
//                         // ModalsetState(() {
//                         //   Rooms++;
//                         // });
//                         ModalsetState(() {
//                           Rooms++;
//                         });
//                         print('Rooms ${Rooms}');
//                       }, icon: Icon(Icons.add)),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Text('${Rooms}',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Bluecolor,
//                               fontWeight: FontWeight.w500
//                           ),),
//                       ),
//                       IconButton(onPressed: Rooms == 1 ? (){} :() {
//                         ModalsetState(() {
//                           Rooms--;
//                         });
//                         print('Rooms ${Rooms}');
//                       }, icon: Icon(Icons.remove)), // icon-2
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   // leading: Text('2'),
//                   title: Text("Adults"),
//                   trailing: Wrap(
//                     spacing: 12, // space between two icons
//                     children: <Widget>[
//                       IconButton(onPressed: () {
//                         ModalsetState(() {
//                           Adult++;
//                         });
//                         print('adult ${Adult}');
//                       }, icon: Icon(Icons.add)),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Text('${Adult}',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Bluecolor,
//                               fontWeight: FontWeight.w500
//                           ),),
//                       ),
//                       IconButton(
//                           onPressed: Adult == 1 ? (){} :() {
//                         ModalsetState(() {
//                           Adult--;
//                         });
//                         print('adult ${Adult}');
//                       }, icon: Icon(Icons.remove)), // icon-2
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("Children"),
//                   trailing: Wrap(
//                     spacing: 12, // space between two icons
//                     children: <Widget>[
//                       IconButton(onPressed: () {
//                         ModalsetState(() {
//                           Children++;
//                         });
//                         print('children ${Children}');
//                       }, icon: Icon(Icons.add)),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
//                         child: Text('${Children}',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Bluecolor,
//                               fontWeight: FontWeight.w500
//                           ),),
//                       ),
//                       IconButton(
//                           onPressed:Children == 0 ? (){} :() {
//                         ModalsetState(() {
//                           Children--;
//                         });
//                         print('children ${Children}');
//                       }, icon: Icon(Icons.remove)),
//
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(onPressed: () {
//                       setState((){
//                       });
//                       Navigator.pop(context);
//                     }, child:
//                     Text('Select', style: TextStyle(
//                       color: Colors.white,
//                     ),),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Bluecolor
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }
}