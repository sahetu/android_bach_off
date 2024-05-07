import 'dart:async';

import 'package:android_bach_off/addList.dart';
import 'package:android_bach_off/bottom_nav.dart';
import 'package:android_bach_off/custom_list.dart';
import 'package:android_bach_off/listdemo.dart';
import 'package:android_bach_off/login.dart';
import 'package:android_bach_off/navigation_demo.dart';
import 'package:android_bach_off/tab_demo.dart';
import 'package:android_bach_off/tween_animation.dart';
import 'package:flutter/material.dart';

class SplashMain extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Splash Screen",
      debugShowCheckedModeBanner: false,
      home: SplashState(),
    );
  }

}

class SplashState extends StatefulWidget{
  @override
  SplashApp createState() => SplashApp();
}

class SplashApp extends State<SplashState>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimerMethod();
  }

  Future<Timer> startTimerMethod() async {
    return Timer(Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (_)=>AddListMain()));
     });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Container(
          width: 100,
          child: Image.asset('images/quickheal1.png'),
        ),
      ),
    );
  }

}