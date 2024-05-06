import 'package:android_bach_off/call_demo.dart';
import 'package:android_bach_off/chat_demo.dart';
import 'package:android_bach_off/status_demo.dart';
import 'package:flutter/material.dart';

class TabMain extends StatefulWidget{

  @override
  TabState createState() => TabState();

}

class TabState extends State<TabMain> with SingleTickerProviderStateMixin{

  late TabController tabController;
  var tabData = [ChatMain(),StatusMain(),CallMain()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabData.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Tab Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tab Demo"),
          bottom: getTab(),
        ),
        body: getTabView(),
      ),
    );
  }

  getTab(){
    return TabBar(
      tabs: [
        Tab(text: "Chat",),
        Tab(text: "Status",),
        Tab(text: "Call",),
      ],
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.white,
      labelColor: Colors.black,
      controller: tabController,
    );
  }

  getTabView(){
    return TabBarView(
      children: tabData,
      controller: tabController,
    );
  }

}