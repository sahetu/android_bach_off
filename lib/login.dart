import 'package:android_bach_off/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginMain extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Login Form",
      debugShowCheckedModeBanner: false,
      home: LoginState(),
    );
  }

}

class LoginState extends StatefulWidget{

  @override
  LoginData createState() => LoginData();

}

class LoginData extends State<LoginState>{

  GlobalKey<FormState> formKey = GlobalKey();
  var emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
  var sEmail,sPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text("Login",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[100],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset("images/quickheal1.png"),
            ),
            Form(
              key: formKey,
              child: Column(
              children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Username",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (username){
                    if(username!.isEmpty){
                      return "Username Required";
                    }
                    else if(!RegExp(emailPattern).hasMatch(username)){
                      return "Valid Username Required";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (username){
                    sEmail = username;
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
                child: TextButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    print("Login Successfully\nUsername = $sEmail, Password = $sPassword");
                    Fluttertoast.showToast(
                      msg: "Login Successfully",
                      backgroundColor: Colors.blueAccent[200],
                      fontSize: 20.0,
                      textColor: Colors.white,
                      webShowClose: true,
                      timeInSecForIosWeb: 1,
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_LONG
                    );

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeApp(sEmail,sPassword)));

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
              ],
            ) ),
          ],
        ),
      ),
    );
  }

}