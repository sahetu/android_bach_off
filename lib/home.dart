import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeApp extends StatefulWidget{
  
  var sEmail,sPassword;
  
  HomeApp(this.sEmail, this.sPassword);


  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<HomeApp>{

  var iRadioButton = 0;
  var cricketCheck = false;
  var readingCheck = false;
  var writingCheck = false;
  var movieCheck = false;

  var checkArray = [];

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
                            genderSelection(1, "Male");                       
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
                              genderSelection(2, "Female");                        
                            });
                  
                          }
                        ),
                        Text("Female",style: TextStyle(fontSize: 18,color: Colors.black),),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: readingCheck, 
                    onChanged: (value){
                      setState(() {
                        readingCheck = value!;
                        hobyMethod(value,"Reading");
                        //print("Reading");
                      });
                    },
                  ),
                  Text(
                    "Reading",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: writingCheck, 
                    onChanged: (value){
                      setState(() {
                        writingCheck = value!;
                        //print("Writing");
                        hobyMethod(value,"Writing");
                      });
                    },
                  ),
                  Text(
                    "Writing",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: movieCheck, 
                    onChanged: (value){
                      setState(() {
                        movieCheck = value!;
                        //print("Movie");
                        hobyMethod(value,"Movie");
                      });
                    },
                  ),
                  Text(
                    "Movie",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: cricketCheck, 
                    onChanged: (value){
                      setState(() {
                        cricketCheck = value!;
                        //print("Cricket");
                        hobyMethod(value,"Cricket");
                      });
                    },
                  ),
                  Text(
                    "Cricket",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void genderSelection(genderValue,genderName){
    iRadioButton = genderValue;
    Fluttertoast.showToast(msg: genderName,toastLength: Toast.LENGTH_LONG);
  }

  hobyMethod(value,name){
    if(value){
      checkArray.add(name);
    }
    else{
      checkArray.removeWhere((element) => element == name);  
    }
    print(checkArray);
  }

}