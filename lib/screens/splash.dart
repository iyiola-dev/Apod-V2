import 'dart:async';

import 'package:APOD/screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTimeOut() {
    return Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return Home();
      }));
    });
  }

  @override
  void initState() {
    startTimeOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/moon.png'),
      ),
    );
  }
}
