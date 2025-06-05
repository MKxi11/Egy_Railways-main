import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mainbutton extends StatelessWidget {
  final String text1;
  final void Function()? onPressed;
  const mainbutton({
    super.key,
    required this.text1,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Color(0xff0057FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(text1,
              style: TextStyle(color: AppColor.colorwhite, fontSize: 22.sp)),
        ),
      ),
    );
  }
}
