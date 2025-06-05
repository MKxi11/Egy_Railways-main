import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Find extends StatefulWidget {
  const Find({super.key});

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> with SingleTickerProviderStateMixin {
  TabController? tabController1;
  String? origin, destination, trainClass;
  int passengerCount = 1;
  DateTime? departureDate;
  String? _selectedPage;
  String? get selectedPage => _selectedPage;
  set selectedPage(String? value) {
    _selectedPage = value;
    setState(() {});
  }

  List<String> stations = [];

  @override
  void initState() {
    super.initState();
    fetchStations();
  }

  Future<void> fetchStations() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('stations').select('name');

    if (response.isNotEmpty) {
      setState(() {
        stations = List<String>.from(response.map((item) => item['name']));
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h, // Set the height of the AppBar
          leading: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Bottombar()));
            },
            child: Image.asset(
              'images/logo.png',
              height: 40.h, // Set the height of the logo
              width: 40.w, // Set the width of the logo
            ),
          ),
          backgroundColor: Colors.white
              .withOpacity(0.8), // Set the AppBar background color with opacity
          title: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Bottombar()));
            },
            child: Text(
              'Egy Railways',
              style: TextStyle(
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [
                      Colors.cyan,
                      const Color.fromARGB(255, 14, 70, 117),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ).createShader(Rect.fromLTWH(0, 0, 400, 70)),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          actions: [
            PopupMenuButton(
              color: const Color.fromARGB(
                  45, 0, 36, 156), // Set the background color of the menu
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.r), // Set the border radius
              ),
              iconSize: 30.sp, // Set the size of the menu icon
              padding: EdgeInsets.only(right: 10.w),
              icon: Icon(Icons.menu, color: AppColor.colorblack, size: 20.sp),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 'settings',
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'profile',
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                // Handle menu item selection
                if (value == 'settings') {
                  // Navigate to settings page
                } else if (value == 'profile') {
                  // Navigate to profile page
                } else if (value == 'logout') {
                  // Handle logout
                }
              },
            ),
          ], // Add settings
        ),
        body: Container(
          height: 500.h,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColor.colorwhite,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(131, 122, 122, 122),
                blurRadius: 5.r,
                offset: Offset(0.w, 2.h),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Book Your Train Ticket',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: AppColor.colorblack,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TextButton(
                  //   onPressed: () {
                  //     // Add your desired functionality here
                  //   },
                  //   child: Text(
                  //     'One way',
                  //     style: TextStyle(
                  //       fontSize: 16.sp,
                  //       fontWeight: FontWeight.bold,
                  //       color: AppColor.colorblue,
                  //     ),
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     // Add your desired functionality here
                  //   },
                  //   child: Text(
                  //     'Round trip',
                  //     style: TextStyle(
                  //       fontSize: 16.sp,
                  //       fontWeight: FontWeight.bold,
                  //       color: AppColor.colorblue,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20.h),
              Material(
                elevation: 0,
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        labelText: 'Origin',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 78, 78, 78),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(Icons.train),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Color(0xff0057FF)),
                        ),
                      ),
                      items: stations
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .where((station) => station != destination)
                          .where((station) => station != origin)
                          .where((station) => station != null)
                          .where(
                              (station) => station.child.toString().isNotEmpty)
                          .where((station) => station.value != null)
                          .where((station) => station.value != '')
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          origin = value;
                        });
                      },
                      value: origin,
                    ),
                    SizedBox(height: 20.h),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        labelText: 'Destination',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 78, 78, 78),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(Icons.train),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Color(0xff0057FF)),
                        ),
                      ),
                      items: stations
                          .where((station) => station != origin)
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          destination = value;
                        });
                      },
                      value: destination,
                    ),
                    SizedBox(height: 20.h),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        labelText: 'Class',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 78, 78, 78),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(Icons.class_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Color(0xff0057FF)),
                        ),
                      ),
                      items: ['First Class', 'Second Class', 'Third Class']
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          trainClass = value;
                        });
                      },
                      value: trainClass,
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        filled: true,
                        labelText: 'Departure Date',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 78, 78, 78),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() {
                            departureDate = picked;
                          });
                        }
                      },
                      controller: TextEditingController(
                        text: departureDate != null
                            ? "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}"
                            : '',
                      ),
                    ),
                    SizedBox(height: 45.h),
                    mainbutton(
                        text1: "Search Trains",
                        onPressed: () {
                          fetchStations();
                        })
                    // Container(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       colors: [
                    //         Colors.lightBlueAccent,
                    //         Color(0xff0057FF),
                    //       ],
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //     ),
                    //     borderRadius: BorderRadius.circular(10.r),
                    //   ),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Homepage(),
                    //         ),
                    //       );
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.transparent,
                    //       shadowColor: Colors.grey, // Shadow color
                    //       elevation: 5.r, // Add shadow
                    //       minimumSize: Size(280.w, 65.h),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.r),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       'Search Trains',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 18.sp,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
