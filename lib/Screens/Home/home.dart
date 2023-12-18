import 'package:flutter/material.dart';
import 'package:goroomy/Constants/colors.dart';
import 'package:goroomy/Custom/text.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Bluecolor,
// automaticallyImplyLeading: false,
// centerTitle: true,
// title: Text('Goroomy.com',
// style: TextStyle(
//   fontSize: 24,
//   color: Colors.white,
//   fontWeight: FontWeight.bold,
//   fontFamily: "Manrope"
// ),),
//     actions: [
// IconButton( icon:ImageIcon(
//   AssetImage('assets/home-1.png'),
// ),
// onPressed: (){},)
//     ],
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height:  MediaQuery.of(context).size.height *0.13,
//         color: Colors.blueGrey,
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
//           child: Column(
//             children: [
//               Text('Book rooms for shorter, cheaper stays that are overnight.'),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // Spacer(),
//                   InkWell(
//                       child: Text('Learnmore..', style: TextStyle(
//                         color: Bluecolor,
//                         fontSize: 12,
//                       ),),
//                     onTap: (){},
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.red,
//                 child: Text('dfasdfads'),
//               ),
//             ],
//           ),
//         ),
//       )
//       // Padding(
//       //   padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.start,
//       //     children: [
//       //       Text('dfsafa')
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  List<String> options = <String>['1 Room 2 adults', 'Two', 'Three', 'Four'];
  String dropdownValue = '1 Room 2 adults';
  final formmater = DateFormat.yMd();
  void _datePicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: first, lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    print('In time picker');
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data:
                MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
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
              icon: ImageIcon(
                AssetImage('assets/home-1.png'),
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
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      // Add padding around the search bar
                      // Use a Material design search bar
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Lahore',
                          // Add a clear button to the search bar
                          suffixIcon: IconButton(
                            icon: Image.asset("assets/home-3.png",height: 25, ),
                            onPressed: () {},
                          ),
                          // Add a search icon or button to the search bar
                          prefixIcon: IconButton(
                            icon: Image.asset("assets/home-2.png",height: 25, ),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
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
                                        : '${selectedTime.hour} : ${selectedTime.minute}')
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
                    child: Container(
                      width: width * 0.82,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      child: Center(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:  Image.asset("assets/home-6.png", height:10, ),
                          ),
                          hint: Text('1 room 2 adults'),
                          items: <String>[
                            '1 Room 2 adults',
                            'Two',
                            'Three',
                            'Four'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      // DropdownButton<String>(
                      //   value: dropdownValue,
                      //   onChanged: (String? value) {
                      //     setState(() {
                      //       dropdownValue = value!;
                      //     });
                      //   },
                      //   underline: const SizedBox(),
                      //   isExpanded: true,
                      //   style: const TextStyle(color: Colors.black),
                      //
                      //   dropdownColor: Colors.white,
                      //   icon: const Icon(Icons.keyboard_arrow_down,
                      //       color: Colors.black),
                      //   selectedItemBuilder: (BuildContext context) {
                      //     return options.map((String value) {
                      //       return Align(
                      //         alignment: Alignment.centerLeft,
                      //         child: Text(
                      //           dropdownValue,
                      //         ),
                      //       );
                      //     }).toList();
                      //   },
                      //   items: options.map<DropdownMenuItem<String>>(
                      //           (String value) {
                      //         return DropdownMenuItem<String>(
                      //           value: value,
                      //           child: Text(value),
                      //         );
                      //       }).toList(),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //         IconButton(
                      //             onPressed: () {},
                      //             icon: const Icon(Icons.person_2)),
                      //
                      //   ],
                      // ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [

                    //     Container(
                    //       width: 200,
                    //       decoration: BoxDecoration(
                    //           color: Colors.blue,
                    //           borderRadius: BorderRadius.circular(30)),
                    //       padding:
                    //       const EdgeInsets.symmetric(horizontal: 10),
                    //       child:

                    // )
                    //   ],
                    // )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width * 0.82,
                    child: ElevatedButton(
                      onPressed: () {},
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
}
