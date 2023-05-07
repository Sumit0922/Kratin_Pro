import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seniorconnect/Dashboard.dart';
import 'package:seniorconnect/Sign_In.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYSIGN = "Error";

  @override
  void initState() {
    super.initState();
    Skip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Skip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var signUp = prefs.getBool(KEYSIGN);

    Timer(Duration(seconds: 1), () {
      if (signUp != null) {
        if (signUp) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => homepage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LoginPage(username: 'username', password: 'password'),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      }
    });
  }
}
