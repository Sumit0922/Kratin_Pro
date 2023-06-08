import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:seniorconnect/Dashboard.dart';
import 'SplashScreen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'High_importance_chance', //id
    'High Importance Notification', //title
    importance: Importance.high,
    playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation
  <AndroidFlutterLocalNotificationsPlugin>()?.
      createNotificationChannel(channel);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

Future<void>_firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();
  print("A bg message just showed up:${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
      // BlocProvider(
      //   create: (context) => DataBloc(),
      //   child: HomePage(),
      // ),
    );
  }
}
// await flutterLocalNotificationsPlugin
//     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//     ?.createNotificationChannel(channel);
//
// await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
// alert: true,
// badge: true,
// sound: true,
// );
//
// runApp(const MyApp());