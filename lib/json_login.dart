import 'dart:convert';

import 'package:android_bach_off/SqliteHelper.dart';
import 'package:android_bach_off/json_profile.dart';
import 'package:android_bach_off/json_signup.dart';
import 'package:android_bach_off/site_constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JsonLoginMain extends StatefulWidget{

  @override
  JsonLoginState createState() => JsonLoginState();

}

class JsonLoginState extends State<JsonLoginMain>{

  GlobalKey<FormState> formKey = GlobalKey();
  var emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
  var sEmail,sPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Json Login",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json Login"),
        ),
        body: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "Email Id",
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (email){
                      if(email!.isEmpty){
                        return "Email Id Required";
                      }
                      else if(!RegExp(emailPattern).hasMatch(email)){
                        return "Valid Email Id Required";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (email){
                      sEmail = email;
                    },
                  ),
                ),
                Padding(
                  //padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "Password",
                      suffixIcon: Icon(Icons.lock)
                    ),
                    validator: (password){
                      if(password!.isEmpty){
                        return "Password Required";
                      }
                      else if(password.length<6){
                        return "Min. 6 Char Password Required";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (password){
                      sPassword = password;
                    },
                  ),
                ),
                Container(
                  color: Colors.blueGrey[200],
                  width: 150,
                  height: 50,
                  child: TextButton(onPressed: () async{
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      var connectivity = await Connectivity().checkConnectivity();
                      if(connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi){
                        JsonLoginMethod();
                      }
                      else{
                        Fluttertoast.showToast(msg: "No Internet Connection",toastLength: Toast.LENGTH_LONG);
                      }
                    }
          
                  }, child: 
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                    color: Colors.blueGrey[200],
                    width: 150,
                    height: 50,
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonSignupMain()));
                    }, child: 
                    Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  JsonLoginMethod() async {
    var sp = await SharedPreferences.getInstance();
    var map = {
      "email":sEmail,
      "password":sPassword
    };

    var data = await http.post(Uri.parse(SiteConstant.LOGIN_URL),body: map);
    if(data.statusCode == 200){
      var jsonData = jsonDecode(data.body);
      if(jsonData["Status"] == true){
        Fluttertoast.showToast(msg: jsonData["Message"],toastLength: Toast.LENGTH_LONG);
        for(int i=0;i<jsonData["UserData"].length;i++){
          sp.setString(SiteConstant.USERID, jsonData["UserData"][i]["userid"]);
          sp.setString(SiteConstant.NAME, jsonData["UserData"][i]["name"]);
          sp.setString(SiteConstant.EMAIL, jsonData["UserData"][i]["email"]);
          sp.setString(SiteConstant.CONTACT, jsonData["UserData"][i]["contact"]);
        }
        Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonProfileMain()));
      }
      else{
        Fluttertoast.showToast(msg: jsonData["Message"],toastLength: Toast.LENGTH_LONG);  
      }
    }
    else{
      Fluttertoast.showToast(msg: "Server Error Code : ${data.statusCode}",toastLength: Toast.LENGTH_LONG);
    }

  }

}