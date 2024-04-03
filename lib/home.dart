import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget{
  
  var sEmail,sPassword;
  
  HomeApp(this.sEmail, this.sPassword);


  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<HomeApp>{

  var iRadioButton = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      home : Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green[100],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(child: Text("Email"),width: 150),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(child: Text(widget.sEmail,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(child: Text("Password"),width: 150,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(widget.sPassword,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1, 
                        groupValue: iRadioButton, 
                        onChanged: (value){
                          setState(() {
                            iRadioButton = 1;
                            print("Male");                        
                          });

                        }
                      ),
                      Text("Male",style: TextStyle(fontSize: 18,color: Colors.black),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Radio(
                          value: 2, 
                          groupValue: iRadioButton, 
                          onChanged: (value){
                            setState(() {
                              iRadioButton=2;
                              print("Female");                        
                            });
                  
                          }
                        ),
                        Text("Female",style: TextStyle(fontSize: 18,color: Colors.black),),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}