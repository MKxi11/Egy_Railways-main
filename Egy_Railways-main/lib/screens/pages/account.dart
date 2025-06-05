import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0057FF),
        centerTitle: true,
        title: Text("Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: ListTile(
              leading: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xffD6D6D6),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset("images/addprofile.png"),
                ),
              ),
              title: Text(
                "Your name",
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
              ),
              subtitle: Text(
                "Your gmail",
                style: TextStyle(color: Colors.black),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.qr_code, color: Color(0xff0057FF), size: 30.sp),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "General",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17.sp),
                ),
              ),
              Expanded(
                  child: Divider(thickness: 1.sp, color: Colors.grey[300])),
            ],
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Personal Info",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.group_outlined,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Passengers List",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.payment_outlined,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Notification",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.security_outlined,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Security",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.language_outlined,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Language",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "About",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17.sp),
                ),
              ),
              Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
            ],
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.description_outlined,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Help Center",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 30.sp,
              ),
              title: Text(
                "About Railify",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
              print("User logged out");
            },
            child: ListTile(
              leading: IconButton(
                onPressed: () async {
                  await Supabase.instance.client.auth.signOut();
                  print("User logged out");
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                  size: 30.sp,
                ),
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
