import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/buttons.dart';
import 'package:egyrailwayes/screens/home/findandLearn.dart';
import 'package:egyrailwayes/screens/home/imagebox.dart';
import 'package:egyrailwayes/screens/home/popularTrains.dart';
import 'package:egyrailwayes/screens/home/textContainter.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2>
    with SingleTickerProviderStateMixin {
  TabController? tabController1;

  @override
  void initState() {
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 14, 70, 117),
              const Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController1,
                children: [
                  ListView(
                    children: [
                      TextContainer(),
                      SizedBox(height: 30.h),
                      findandLearn(),
                      SizedBox(height: 50.h),
                      Buttons(),
                      SizedBox(height: 200.h),
                      Populartrains(),
                      SizedBox(height: 50.h),
                      imagebox(),
                      SizedBox(height: 50.h),
                    ],
                  ),
                  ListView(
                    children: [
                      SizedBox(height: 20.h),
                      Buttons(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
