import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/constants/sigup_with.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/constants/text_intro.dart';
import 'package:egyrailwayes/screens/start/reset_password.dart';
import 'package:egyrailwayes/screens/start/signup1.dart';
import 'package:egyrailwayes/screens/start/verify.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  bool _rememberMe = false;
  bool _isPasswordHidden = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40.h),
                Text("Welcome back! 👋"),
                SizedBox(height: 12.h),
                Text(
                  "Please enter your email & password to login.",
                  style: TextStyle(
                    color: AppColor.colorhint,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 40.h),
                TextFormFieldWidget(
                  controller: _emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 24.h),
                TextFormFieldWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: _isPasswordHidden,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.colorblue,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: AppColor.colorblue,
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColor.colorblue,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                mainbutton(
                  text1: "Log In",
                  onPressed: _login,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup1(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.colorblue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "or continue with",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignupWithButton(
                      imagePath: "images/google.png",
                      onTap: _signInWithGoogle,
                    ),
                    SizedBox(width: 20.w),
                    SignupWithButton(
                      imagePath: "images/facebook11111.png",
                      onTap: () {
                        // Handle Facebook sign-in
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await Supabase.instance.client.auth.signInWithPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (response.user?.email != null) {
          print("Login successful");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Verify()),
          ).catchError((error) {
            print("Navigation error: $error");
          });
        }
      } catch (error) {
        print("Login error: $error");
        // Optionally show an error message to the user
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      const webClientId =
          '707965051749-ammkgu1u361t9gfsdf8pdv9jn23t3t2q.apps.googleusercontent.com';
      final GoogleSignIn googleSignIn =
          GoogleSignIn(serverClientId: webClientId);
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      final response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken!,
      );

      if (response.session != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Verify()),
        ).catchError((error) {
          print("Navigation error: $error");
        });
      } else {
        _showErrorDialog("Failed to authenticate with Google.");
      }
    } catch (e) {
      _showErrorDialog(
          "An error occurred during Google sign-in. Please try again.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Authentication Failed"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColor.colorblue,
              )
            : null,
      ),
    );
  }
}

class SignupWithButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SignupWithButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Ink(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Image.asset(imagePath, height: 30.h),
        ),
      ),
    );
  }
}
