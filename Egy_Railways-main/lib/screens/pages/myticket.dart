import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myticket extends StatefulWidget {
  const Myticket({super.key});

  @override
  State<Myticket> createState() => _MyticketState();
}

class _MyticketState extends State<Myticket>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Bar(),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              child: TabBar(
                controller: tabController,
                labelColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedLabelColor: Colors.grey,
                indicatorColor: const Color.fromARGB(255, 0, 0, 0),
                tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Past'),
                Tab(text: 'Cancelled'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Center(child: Text('Upcoming Tickets')),
                Center(child: Text('Past Tickets')),
                Center(child: Text('Cancelled Tickets')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// This code defines a Myticket widget that displays a tabbed interface for viewin
