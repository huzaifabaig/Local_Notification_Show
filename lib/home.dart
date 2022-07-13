import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initialionSettingsAndroid =
        // ignore: unnecessary_new
        new AndroidInitializationSettings('app_icon');

    var initializationSettings =
        new InitializationSettings(android: initialionSettingsAndroid);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Payload"),
            content: Text("Payload: $payload"),
          );
        });
  }

  // ignore: unused_element
  Future _showNotification() async {
    // ignore: prefer_const_constructors, unnecessary_new
    var androidPlatformChannelSpeifics = new AndroidNotificationDetails(
        'notitifcation_channel_id',
        'Notification',
        'Here we will put the description about the channel and it is used for notification',
        playSound: false,
        importance: Importance.max,
        priority: Priority.high);

    var platformChannelSpecifics =
        // ignore: unnecessary_new
        new NotificationDetails(android: androidPlatformChannelSpeifics);
    await flutterLocalNotificationsPlugin.show(0, 'New Post',
        'How to Show Notification in Flutter', platformChannelSpecifics,
        payload: 'No_Sound');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: 
          _showNotification,
          child: const Text('Click me'),
        ),
      ),
    );
  }
}




