import 'package:egyrailwayes/screens/home/findandLearn.dart';
import 'package:egyrailwayes/screens/pages/find.dart';
import 'package:egyrailwayes/core/config/app_config.dart';
import 'package:egyrailwayes/screens/start/language.dart';
import 'package:egyrailwayes/screens/start/login2.dart';
import 'package:egyrailwayes/screens/start/signup1.dart';
import 'package:egyrailwayes/screens/start/splash.dart';
import 'package:egyrailwayes/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://eijgmrkhmvstinlbyfrh.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVpamdtcmtobXZzdGlubGJ5ZnJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYyODQ4NTYsImV4cCI6MjA2MTg2MDg1Nn0.PWG2yzHr7cdZW315LumKn0cGS1YgFtGMg8yrFABK1sk",
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;



class MyApp extends StatelessWidget {
  const MyApp({super.key});
static SupabaseClient get supabase => Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Signup1(),
        );
      },
    );
  }
}
