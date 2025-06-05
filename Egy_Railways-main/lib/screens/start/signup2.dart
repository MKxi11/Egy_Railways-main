import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signup2 extends StatefulWidget {
  const signup2({super.key});

  @override
  State<signup2> createState() => _SignupState();
}

class _SignupState extends State<signup2> {
  bool _isPasswordHidden = true;
  bool _isPasswordHidden2 = true;
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey3,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25.h,
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
                      child: Text(
                        "Complete your profile",
                        style: TextStyle(
                            color: AppColor.colorblack,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 340.w,
                  // margin: EdgeInsets.only(right: 80.w),
                  child: Text(
                    "Please enter your profile. Don't worry, only you can see your personal data, No one else will be able to see it.",
                    style: TextStyle(
                      color: AppColor.colorhint,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                      color: AppColor.colorprofile,
                      borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "images/addprofile.png",
                      )),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  child: textfromfield(
                    controller: TextEditingController(),
                    validator: (value1) {
                      if (value1 == "") {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    hinttext: "Full Name",
                    suffixIcon: Icon(
                      Icons.person_outline,
                      color: AppColor.colorblue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  child: textfromfield(
                    controller: TextEditingController(),
                    validator: (value1) {
                      if (value1 == "") {
                        return "Please enter your phone number";
                      }
                      return null;
                    },
                    hinttext: "Phone Number",
                    suffixIcon: Icon(
                      Icons.phone_outlined,
                      color: AppColor.colorblue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  child: textfromfield(
                    controller: TextEditingController(),
                    validator: (value1) {
                      if (value1 == "") {
                        return "Please enter your national ID Number ";
                      }
                      return null;
                    },
                    hinttext: "National ID Number",
                    suffixIcon:
                        Icon(Icons.badge_outlined, color: AppColor.colorblue),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  child: textfromfield(
                    controller: TextEditingController(),
                    validator: (value1) {
                      if (value1 == "") {
                        return "Please enter your birthday";
                      }
                      return null;
                    },
                    hinttext: "Date of Birth DD/MM/YYYY",
                    suffixIcon: Icon(Icons.calendar_today_outlined,
                        color: AppColor.colorblue),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  child: mainbutton(
                      text1: "Continue",
                      onPressed: () {
                        //vaoldator
                        // if (formKey3.currentState!.validate()) {
                        //   print("valid");
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: Image.asset(
                        //           "images/user1.png",
                        //           height: 160.0,
                        //         ),
                        //         content: Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Container(
                        //                 child: Text(
                        //               "Sign up Successfully!",
                        //               style: TextStyle(
                        //                 color: AppColor.colorblue,
                        //                 fontSize: 20,
                        //               ),
                        //             )),
                        //             Container(
                        //                 margin: EdgeInsets.only(top: 10),
                        //                 child: Text(
                        //                   "You will be directed to the home page",
                        //                   style: TextStyle(
                        //                     color: AppColor.colorblack,
                        //                     fontSize: 16,
                        //                   ),
                        //                 )),
                        //           ],
                        //         ),
                        //         actions: [
                        //           TextButton(
                        //             onPressed: () {
                        //               Navigator.of(context).pop();
                        //             },
                        //             child: Text("OK",
                        //                 style: TextStyle(
                        //                   color: AppColor.colorblue,
                        //                   fontSize: 16,
                        //                 )),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   );
                        // } else {
                        //   print("not valid");
                        // }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Image.asset(
                                "images/user1.png",
                                height: 160.0.h,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      child: Text(
                                    "Sign up Successfully!",
                                    style: TextStyle(
                                      color: AppColor.colorblue,
                                      fontSize: 20.sp,
                                    ),
                                  )),
                                  Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      child: Text(
                                        "You will be directed to the home page",
                                        style: TextStyle(
                                          color: AppColor.colorblack,
                                          fontSize: 16.sp,
                                        ),
                                      )),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK",
                                      style: TextStyle(
                                        color: AppColor.colorblue,
                                        fontSize: 16.sp,
                                      )),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                ),

                // SizedBox(
                //   height: 15.h,
                // ),
                // Container(
                //   child: textfromfield(
                //     hinttext: "Phone Number",
                //     suffixIcon: Icon(
                //       Icons.phone_outlined,
                //       color: AppColor.colorblue,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   child: textfromfield(
                //     hinttext: "National ID Number",
                //     suffixIcon:
                //         Icon(Icons.badge_outlined, color: AppColor.colorblue),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   child: textfromfield(
                //     hinttext: "Email",
                //     suffixIcon: Icon(
                //       Icons.email_outlined,
                //       color: AppColor.colorblue,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   child: textfromfield(
                //     obscureText: _isPasswordHidden,
                //     hinttext: "Password",
                //     suffixIcon: IconButton(
                //         onPressed: () {
                //           setState(() {
                //             _isPasswordHidden = !_isPasswordHidden;
                //           });
                //         },
                //         icon: Icon(
                //           _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                //           color: AppColor.colorblue,
                //           // size: 20.0,
                //         )),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   child: textfromfield(
                //     obscureText: _isPasswordHidden2,
                //     hinttext: "Confirm Password",
                //     suffixIcon: IconButton(
                //         onPressed: () {
                //           setState(() {
                //             _isPasswordHidden2 = !_isPasswordHidden2;
                //           });
                //         },
                //         icon: Icon(
                //           _isPasswordHidden2
                //               ? Icons.visibility_off
                //               : Icons.visibility,
                //           color: AppColor.colorblue,
                //           // size: 20.0,
                //         )),
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
