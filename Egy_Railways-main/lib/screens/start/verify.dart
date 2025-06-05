import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/start/signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Container(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColor.colorblue,
                        )),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 300.w,
                    // margin: EdgeInsets.only(right: 100.w),
                    child: Text(
                      "Let's verify your identity",
                      style: TextStyle(
                          color: AppColor.colorblack,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 320.w,
                // margin: EdgeInsets.only(right: 80.w),
                child: Text(
                  "We want to confirm your identity before you can use our service.",
                  style: TextStyle(
                    color: AppColor.colorhint,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Container(
                  // width: 500,
                  child: Image.asset("images/signin.png"),
                ),
              ),
              SizedBox(
                height: 85.h,
              ),
              mainbutton(
                  text1: "Let's verify",
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => signup2()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
