import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/start/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
            ),
            Container(
              child: Image.asset("images/logo2.png"),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Text(
                "Egy Railway",
                style: TextStyle(
                    color: AppColor.colorblack,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              child: Text(
                "Please select your language",
                style: TextStyle(color: AppColor.colorblack, fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            mainbutton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              text1: " العربية",
            ),
            SizedBox(
              height: 25.h,
            ),
            mainbutton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              text1: " English",
            )
          ],
        ),
      ),
    );
  }
}
