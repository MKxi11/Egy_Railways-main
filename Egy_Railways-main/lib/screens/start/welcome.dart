import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/sigup_with.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/start/login2.dart';
import 'package:egyrailwayes/screens/start/signup1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              child: Image.asset(
                "images/logo.png",
                height: 220.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Text(
                "Egy Railway",
                style: TextStyle(
                    color: AppColor.colorblack,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              width: 350.w,
              child: Text(
                  "Welcome! Let's start by creating your account or log in if you already have one.",
                  style: TextStyle(
                    fontSize: 16.sp,
                  )),
            ),
            // Container(
            //   child: Text("or log in if you already have one.",
            //       style: TextStyle(
            //         fontSize: 16.sp,
            //       )),
            // ),
            SizedBox(
              height: 50.h,
            ),
            mainbutton(
                text1: "Sign Up",
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Signup1()));
                }),
            SizedBox(
              height: 25.h,
            ),
            mainbutton(
                text1: "Log In",
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login2()));
                }),
            SizedBox(
              height: 45.h,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 1.w,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "or continue with",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1.w,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signupwith(
                  onTap: () {},
                  image1: "images/google.png",
                ),
                SizedBox(
                  width: 20.w,
                ),
                signupwith(
                  onTap: () {},
                  image1: "images/facebook11111.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
