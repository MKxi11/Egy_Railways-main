import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class alarm extends StatefulWidget {
  const alarm({super.key});

  @override
  State<alarm> createState() => _alarmState();
}

class _alarmState extends State<alarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Alarm Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                FlutterLocalNotificationsPlugin
                    flutterLocalNotificationsPlugin =
                    FlutterLocalNotificationsPlugin();
                const AndroidInitializationSettings
                    initializationSettingsAndroid =
                    AndroidInitializationSettings('app_icon');
                final InitializationSettings initializationSettings =
                    InitializationSettings(
                        android: initializationSettingsAndroid);
                await flutterLocalNotificationsPlugin
                    .initialize(initializationSettings);
                const AndroidNotificationDetails
                    androidPlatformChannelSpecifics =
                    AndroidNotificationDetails(
                  'alarm_channel',
                  'Alarm',
                  channelDescription: 'Channel for Alarm notification',
                  importance: Importance.max,
                  priority: Priority.high,
                  ticker: 'ticker',
                );
                const NotificationDetails platformChannelSpecifics =
                    NotificationDetails(
                        android: androidPlatformChannelSpecifics);
                await flutterLocalNotificationsPlugin.show(
                    0, 'Alarm', 'Wake up!', platformChannelSpecifics,
                    payload: 'item x');
                // Schedule the alarm for a specific time
                // You can use the flutter_local_notifications package to schedule alarms
                // For example, to schedule an alarm for 7:00 AM:
              },
              child: const Text('Set Alarm', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Cancel Alarm
              },
              child: const Text(
                'Cancel Alarm',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
