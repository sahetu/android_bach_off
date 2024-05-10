import 'package:android_bach_off/SqliteHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SqliteMain extends StatefulWidget{

  @override
  SqliteState createState() => SqliteState();

}

class SqliteState extends State<SqliteMain>{

  GlobalKey<FormState> formKey = GlobalKey();
  var emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
  var sEmail,sPassword,sName,sContact;
  var dbHelper = SqliteHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Sqlite Demo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sqlite Database"),
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
                  child: TextButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      insertData();
                    }
          
                  }, child: 
                  Text(
                    "Insert",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Container(
                    color: Colors.blueGrey[200],
                    width: 150,
                    height: 50,
                    child: TextButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        updateData();
                      }
                            
                    }, child: 
                    Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Container(
                    color: Colors.blueGrey[200],
                    width: 150,
                    height: 50,
                    child: TextButton(onPressed: (){
                      formKey.currentState!.save();
                      deleteData();
                    }, child: 
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Container(
                    color: Colors.blueGrey[200],
                    width: 150,
                    height: 50,
                    child: TextButton(onPressed: (){
                      getAllData();
                    }, child: 
                    Text(
                      "Show All",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 10.0),
                    child: Container(
                    color: Colors.blueGrey[200],
                    width: 150,
                    height: 50,
                    child: TextButton(onPressed: (){
                      formKey.currentState!.save();
                      getSearchData();
                    }, child: 
                    Text(
                      "Search",
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

  void insertData() async{
    print(sName+"___"+sEmail+"___"+sContact+"___"+sPassword);
    Map<String,dynamic> map = {
      SqliteHelper.COLUMN_NAME : sName,
      SqliteHelper.COLUMN_EMAIL : sEmail,
      SqliteHelper.COLUMN_CONTACT : sContact,
      SqliteHelper.COLUMN_PASSWORD : sPassword,
    };

  final id = await dbHelper.insert(map);
  Fluttertoast.showToast(msg: "Insert Successfully",toastLength: Toast.LENGTH_LONG);
  print(id);
  }

  void updateData() async{
    print(sName+"___"+sEmail+"___"+sContact+"___"+sPassword);
    Map<String,dynamic> map = {
      SqliteHelper.COLUMN_NAME : sName,
      SqliteHelper.COLUMN_EMAIL : sEmail,
      SqliteHelper.COLUMN_PASSWORD : sPassword,
    };
    final id = await dbHelper.update(map,sContact);
    Fluttertoast.showToast(msg: "Update Successfully",toastLength: Toast.LENGTH_LONG);
    print(id);
  }

  void deleteData() async{
    print(sContact);

    final id = await dbHelper.delete(sContact);
    Fluttertoast.showToast(msg: "Delete Successfully",toastLength: Toast.LENGTH_LONG);
    print(id);
  }

  void getAllData() async{
    var data = await dbHelper.getAllData();
    for(int i=0;i<data.length;i++){
      print(data[i]);
      print(data[i]['column_name']);
    }
  }

  void getSearchData() async{
    var data = await dbHelper.getSearchData(sContact);
    for(int i=0;i<data.length;i++){
      print(data[i]);
      print(data[i]['column_name']);
    }
  }



}