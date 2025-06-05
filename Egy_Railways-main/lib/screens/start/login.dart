// import 'package:egyrailwayes/constants/app_color.dart';
// import 'package:egyrailwayes/constants/sigup_with.dart';
// import 'package:egyrailwayes/constants/text_from_field.dart';
// import 'package:egyrailwayes/constants/text_intro.dart';
// import 'package:egyrailwayes/constants/main_button.dart';
// import 'package:egyrailwayes/screens/reset_password.dart';
// import 'package:egyrailwayes/screens/signup1.dart';
// import 'package:egyrailwayes/screens/signup2.dart';
// import 'package:egyrailwayes/screens/verify.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool value = false;
//   bool _isPasswordHidden = true;
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   Login() async {
//     final response = await Supabase.instance.client.auth.signInWithPassword(
//       email: emailController.text,
//       password: passwordController.text,
//     );
//     if (response.error == null) {
//       print("Login successful");
//     } else {
//       print("Login failed: ${response.error?.message}");
//     }
//   }

//   // Future<void> signInWithGoogle() async {
//   //   try {
//   //     final googleUser = await GoogleSignIn().signIn();
//   //     if (googleUser == null) {
//   //       print('User cancelled the sign-in process');
//   //       return;
//   //     }

//   //     final googleAuth = await googleUser.authentication;

//   //     final idToken = googleAuth.idToken;
//   //     final accessToken = googleAuth.accessToken;

//   //     final response = await Supabase.instance.client.auth.signInWithIdToken(
//   //       provider: OAuthProvider.google,
//   //       idToken: idToken!,
//   //       accessToken: accessToken,
//   //     );

//   //     print("Login successful with Google: ${response.user}");
//   //   } catch (e) {
//   //     print("Error signing in with Google: $e");
//   //   }
//     // Future<void> signInWithGoogle() async {
//     //   try {
//     //     // استخدم Web Client ID هنا
//     //     final googleSignIn = GoogleSignIn(
//     //       clientId:
//     //           '707965051749-a9hoh91l8bp6coniunsdtjc40sfjhoi9.apps.googleusercontent.com', // ← حط Web Client ID هنا
//     //       scopes: ['email'],
//     //     );

//     //     final googleUser = await googleSignIn.signIn();
//     //     if (googleUser == null) {
//     //       print('User cancelled the sign-in process');
//     //       return;
//     //     }

//     //     final googleAuth = await googleUser.authentication;

//     //     final idToken = googleAuth.idToken;
//     //     final accessToken = googleAuth.accessToken;

//     //     final response = await Supabase.instance.client.auth.signInWithIdToken(
//     //       provider: OAuthProvider.google,
//     //       idToken: idToken!,
//     //       accessToken: accessToken,
//     //     );

//     //     print("✅ Login successful with Google: ${response.user}");
//     //   } catch (e) {
//     //     print("❌ Error signing in with Google: $e");
//     //   }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.colorwhite,
//       body: Form(
//         key: formKey,
//         child: ListView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 textintro(
//                   text: "Welcome back 👋",
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Container(
//                   width: 320.w,
//                   margin: EdgeInsets.only(left: 30.w),
//                   child: Text(
//                     "Please enter your email & password to login.",
//                     style: TextStyle(
//                       color: AppColor.colorhint,
//                       fontSize: 15.sp,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 textfromfield(
//                   controller: emailController,
//                   validator: (value) {
//                     if (value == "") {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                   hinttext: "Email",
//                   suffixIcon: Icon(
//                     Icons.email_outlined,
//                     color: Color(0xff0057FF),
//                     size: 20.0.sp,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 textfromfield(
//                     controller: passwordController,
//                     validator: (value) {
//                       if (value == "") {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     obscureText: _isPasswordHidden,
//                     hinttext: "Password",
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordHidden = !_isPasswordHidden;
//                           });
//                         },
//                         icon: Icon(
//                           _isPasswordHidden
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: Color(0xff0057FF),
//                           size: 20.0.sp,
//                         ))),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 60.w),
//                   child: CheckboxListTile(
//                       activeColor: AppColor.colorblue,
//                       controlAffinity: ListTileControlAffinity.leading,
//                       title: Text(
//                         "Remember me",
//                         style: TextStyle(
//                             color: AppColor.colorblack, fontSize: 15.sp),
//                       ),
//                       value: value,
//                       onChanged: (val) {
//                         setState(() {
//                           value = val ?? false;
//                         });
//                       }),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Divider(
//                   color: AppColor.colordivider,
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Center(
//                   child: Container(
//                     child: MaterialButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ResetPassword()));
//                       },
//                       child: Text(
//                         "Forgot Password?",
//                         style: TextStyle(
//                             color: AppColor.colorblue, fontSize: 16.sp),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Center(
//                   child: Container(
//                     child: RichText(
//                         text: TextSpan(
//                             text: "Don't have an account?",
//                             style: TextStyle(
//                                 color: AppColor.colorblack, fontSize: 17.w),
//                             children: [
//                           TextSpan(
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => Signup1()));
//                                 },
//                               text: " Sign Up",
//                               style: TextStyle(
//                                   color: AppColor.colorblue, fontSize: 17.sp))
//                         ])),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Divider(
//                         thickness: 1.w,
//                         color: Colors.grey[300],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text(
//                         "or continue with",
//                         style: TextStyle(color: Colors.grey[600]),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         thickness: 1.w,
//                         color: Colors.grey[300],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     signupwith(
//                       onTap: () {
//                         // signInWithGoogle();
//                       },
//                       image1: "images/google.png",
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     signupwith(
//                       onTap: () {},
//                       image1: "images/apple.png",
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     signupwith(
//                       onTap: () {},
//                       image1: "images/facebook11111.png",
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Divider(
//                   color: AppColor.colordivider,
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 mainbutton(
//                     text1: "Log In",
//                     onPressed: () {
//                       Login();
//                       //validator
//                       // if (formKey.currentState!.validate()) {
//                       //   print("valid");
//                       //   showDialog(
//                       //       context: context,
//                       //       builder: (context) {
//                       //         return AlertDialog(
//                       //           title: Image.asset(
//                       //             "images/user1.png",
//                       //             height: 160.0,
//                       //           ),
//                       //           content: Column(
//                       //             mainAxisSize: MainAxisSize.min,
//                       //             children: [
//                       //               Container(
//                       //                   child: Text(
//                       //                 "Log In Successfully!",
//                       //                 style: TextStyle(
//                       //                   color: AppColor.colorblue,
//                       //                   fontSize: 20,
//                       //                 ),
//                       //               )),
//                       //               Container(
//                       //                   margin: EdgeInsets.only(top: 10),
//                       //                   child: Text(
//                       //                     "You will be directed to the home page",
//                       //                     style: TextStyle(
//                       //                       color: AppColor.colorblack,
//                       //                       fontSize: 16,
//                       //                     ),
//                       //                   )),
//                       //             ],
//                       //           ),
//                       //           actions: [
//                       //             TextButton(
//                       //               onPressed: () {
//                       //                 Navigator.of(context).pop();
//                       //               },
//                       //               child: Text("OK",
//                       //                   style: TextStyle(
//                       //                     color: AppColor.colorblue,
//                       //                     fontSize: 16,
//                       //                   )),
//                       //             ),
//                       //           ],
//                       //         );
//                       //       });
//                       // } else {
//                       //   print("not valid");
//                       // }
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Image.asset(
//                                 "images/user1.png",
//                                 height: 160.0.h,
//                               ),
//                               content: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Container(
//                                       child: Text(
//                                     "Log In Successfully!",
//                                     style: TextStyle(
//                                       color: AppColor.colorblue,
//                                       fontSize: 20.sp,
//                                     ),
//                                   )),
//                                   Container(
//                                       margin: EdgeInsets.only(top: 10.h),
//                                       child: Text(
//                                         "You will be directed to the home page",
//                                         style: TextStyle(
//                                           color: AppColor.colorblack,
//                                           fontSize: 16.sp,
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Text("OK",
//                                       style: TextStyle(
//                                         color: AppColor.colorblue,
//                                         fontSize: 16.sp,
//                                       )),
//                                 ),
//                               ],
//                             );
//                           });
//                       // Navigator.of(context)
//                       //     .push(MaterialPageRoute(builder: (context) => Signup1()));
//                     }),
//                 SizedBox(
//                   height: 20.h,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// extension on AuthResponse {
//   get error => null;
// }
