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
        title: Text(
          "Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                size: 25.sp,
              ),
              title: Text(
                "My Profile",
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
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.edit_outlined,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Edit Profile",
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
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Update Password",
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
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.book_online_outlined,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "My Booking",
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
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.train_outlined,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Find Train",
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
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Help & Support",
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
                  size: 25.sp,
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
