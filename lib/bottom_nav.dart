import 'package:android_bach_off/call_demo.dart';
import 'package:android_bach_off/chat_demo.dart';
import 'package:android_bach_off/status_demo.dart';
import 'package:flutter/material.dart';

class BottomNavMain extends StatefulWidget{

  @override
  BottomNavState createState() => BottomNavState();

}

class BottomNavState extends State<BottomNavMain>{

  var tabData = [ChatMain(),StatusMain(),CallMain()];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Bottom Navigation",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation"),
        ),
        body: tabData[index],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),label: "Chat"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_outline_sharp),label: "Status"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),label: "Call"
            ),
          ],
          currentIndex: index,
          selectedItemColor: Colors.black,
          onTap: (clickIndex){
            ClickMethod(clickIndex);
          },
        ),
      ),
    );
  }

  ClickMethod(var clickIndex){
    setState(() {
      index = clickIndex;
    });
  }

}