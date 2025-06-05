import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:egyrailwayes/constants/sigup_with.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/constants/text_intro.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/main.dart';
import 'package:egyrailwayes/screens/start/login2.dart';
import 'package:egyrailwayes/screens/start/verify.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _LoginState();
}

class _LoginState extends State<Signup1> {
  bool value = false;
  bool _isPasswordHidden = true;
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userid;
  @override
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange.listen((data) {
      setState(() {
        userid = data.session?.user.id;
      });
    });
  }

  Future<void> Signup() async {
    if (!formKey2.currentState!.validate()) return;

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.user != null) {
        print("Signup successful");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Verify()),
        );
      } else {
        print("Signup failed: No user returned");
      }
    } catch (e) {
      print("Signup error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorwhite,
      body: Form(
        key: formKey2,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                textintro(
                  text: "Hello there 👋",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 340.w,
                  margin: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "Please enter your email & password to create an account.",
                    style: TextStyle(
                      color: AppColor.colorhint,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                textfromfield(
                  controller: emailController,
                  validator: (value1) {
                    if (value1 == "") {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  hinttext: "Email",
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(0xff0057FF),
                    size: 20.0.sp,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                textfromfield(
                    controller: passwordController,
                    validator: (value1) {
                      if (value1 == "") {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    obscureText: _isPasswordHidden,
                    hinttext: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff0057FF),
                          size: 20.0.sp,
                        ))),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 300.w,
                  margin: EdgeInsets.only(left: 60.w),
                  child: CheckboxListTile(
                      activeColor: AppColor.colorblue,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: RichText(
                          text: TextSpan(
                              text: "I agree to eayrailwayes ",
                              style: TextStyle(
                                  color: AppColor.colorblack, fontSize: 15.sp),
                              children: [
                            TextSpan(
                                text: " Terms. & Privacy Policy",
                                style: TextStyle(
                                  color: AppColor.colorblue,
                                  fontSize: 15.sp,
                                )),
                          ])),
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val ?? false;
                        });
                      }),
                ),
                // Center(
                //   child: Container(
                //     child: MaterialButton(
                //       onPressed: () {
                //         Navigator.of(context).push(
                //             MaterialPageRoute(builder: (context) => ResetPassword()));
                //       },
                //       child: Text(
                //         "Forgot Password?",
                //         style: TextStyle(color: AppColor.colorblack, fontSize: 16),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                Divider(
                  color: AppColor.colordivider,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Container(
                    child: RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                                color: AppColor.colorblack, fontSize: 16.sp),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Login2()));
                                },
                              text: " Log in",
                              style: TextStyle(
                                  color: AppColor.colorblue, fontSize: 16.sp))
                        ])),
                  ),
                ),
                SizedBox(
                  height: 25.h,
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
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    signupwith(
                      onTap: () async {
                        ///
                        /// Web Client ID that you registered with Google Cloud.
                        const webClientId =
                            '707965051749-ammkgu1u361t9gfsdf8pdv9jn23t3t2q.apps.googleusercontent.com';

                        ///
                        /// iOS Client ID that you registered with Google Cloud.
                        const iosClientId = 'my-ios.apps.googleusercontent.com';

                        // Google sign in on Android will work without providing the Android
                        // Client ID registered on Google Cloud.

                        final GoogleSignIn googleSignIn = GoogleSignIn(
                          // clientId: iosClientId,
                          serverClientId: webClientId,
                        );
                        final googleUser = await googleSignIn.signIn();
                        final googleAuth = await googleUser!.authentication;
                        final accessToken = googleAuth.accessToken;
                        final idToken = googleAuth.idToken;

                        if (accessToken == null) {
                          throw 'No Access Token found.';
                        }
                        if (idToken == null) {
                          throw 'No ID Token found.';
                        }

                        final response = await supabase.auth.signInWithIdToken(
                          provider: OAuthProvider.google,
                          idToken: idToken,
                          accessToken: accessToken,
                        );

                        if (response.session != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Bottombar()));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Authentication Failed"),
                                content:
                                    Text("Unable to authenticate with Google."),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      image1: "images/google.png",
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    // signupwith(
                    //   onTap: () {},
                    //   image1: "images/apple.png",
                    // ),
                    // SizedBox(
                    //   width: 20.w,
                    // ),
                    signupwith(
                      onTap: () {},
                      image1: "images/facebook11111.png",
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Divider(
                  color: AppColor.colordivider,
                ),
                SizedBox(
                  height: 25.h,
                ),
                mainbutton(
                  text1: "Sign Up",
                  onPressed: () {
                    if (!value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "You must agree to the Terms & Privacy Policy."),
                        ),
                      );
                      return;
                    }
                    if (!formKey2.currentState!.validate()) {
                      return;
                    }
                    Signup();
                  },
                ),
                //vaildator
                // if (formKey2.currentState!.validate()) {
                //   print("valid");
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) => Verify()));
                // } else {
                //   print("not valid");
                // }
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Verify()));

                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on AuthResponse {
  get error => null;
}
