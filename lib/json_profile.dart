import 'dart:convert';

import 'package:android_bach_off/SqliteHelper.dart';
import 'package:android_bach_off/json_login.dart';
import 'package:android_bach_off/site_constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JsonProfileMain extends StatefulWidget{

  @override
  JsonProfileState createState() => JsonProfileState();

}

class JsonProfileState extends State<JsonProfileMain>{

  GlobalKey<FormState> formKey = GlobalKey();
  var emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
  var sEmail,sPassword,sName,sContact;
  var nameController,emailController,contactController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() async{
    var sp = await SharedPreferences.getInstance();
    setState(() {

        // if(sp.getString(SiteConstant.NAME)==""){
        //   nameController = TextEditingController(text: "Flutter Default");          
        // }
        // else{
        //   nameController = TextEditingController(text: sp.getString(SiteConstant.NAME));
        // }
        nameController = TextEditingController(text: sp.getString(SiteConstant.NAME) ?? "Flutter Default");
        emailController = TextEditingController(text: sp.getString(SiteConstant.EMAIL));
        contactController = TextEditingController(text: sp.getString(SiteConstant.CONTACT));
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Json Profile",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json Profile"),
        ),
        body: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (name){
                      if(name!.isEmpty){
                        return "Name Required";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (name){
                      sName = name;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: TextFormField(
                    controller: emailController,
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
                  padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: TextFormField(
                    controller: contactController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: "Contact No.",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (contact){
                      if(contact!.isEmpty){
                        return "Contact No. Required";
                      }
                      else if(contact.length<10 || contact.length>10){
                        return "Valid Contact No. Required";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (contact){
                      sContact = contact;
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
                        JsonUpdateMethod();
                      }
                      else{
                        Fluttertoast.showToast(msg: "No Internet Connection",toastLength: Toast.LENGTH_LONG);
                      }
                    }
          
                  }, child: 
                  Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                    color: Colors.blueGrey[200],
                    width: 150,
                    height: 50,
                    child: TextButton(onPressed: () async{
                      var sp = await SharedPreferences.getInstance();
                      sp.clear();
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonLoginMain()));
                            
                    }, child: 
                    Text(
                      "Logout",
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

  JsonUpdateMethod() async {
    var sp = await SharedPreferences.getInstance();
    var sUserId = sp.getString(SiteConstant.USERID);
    var map = {
      "userId":sUserId,
      "userName":sName,
      "name":sName,
      "email":sEmail,
      "contact":sContact,
      "password":sPassword,
      "gender":"Male",
      "city":"Ahmedabad"
    };

    var data = await http.post(Uri.parse(SiteConstant.UPDATE_URL),body: map);
    if(data.statusCode == 200){
      var jsonData = jsonDecode(data.body);
      if(jsonData["Status"] == true){
        Fluttertoast.showToast(msg: jsonData["Message"],toastLength: Toast.LENGTH_LONG);
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