import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationMain extends StatefulWidget{

  @override
  NavigationState createState() => NavigationState();

}

class NavigationState extends State<NavigationMain>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Navigation Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Demo"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Navigation Flutter"), 
                accountEmail: Text("navigation@gmail.com"),
                currentAccountPicture: Icon(Icons.verified_user),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),  
                onTap: () {
                  showMessage("Home");
                },
              ),
              ListTile(
                leading: Icon(Icons.verified_user_rounded),
                title: Text("Profile"),  
                onTap: () {
                  showMessage("Profile");
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Change Password"),  
                onTap: () {
                  showMessage("Change Password");
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),  
                onTap: () {
                  showMessage("Logout");
                },
              ),
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }

  showMessage(var message){
    Fluttertoast.showToast(msg: message,toastLength: Toast.LENGTH_LONG);
  }

}