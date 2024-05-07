import 'package:flutter/material.dart';

class AddListMain extends StatefulWidget{

  @override
  AddListState createState() => AddListState();

}

class AddListState extends State<AddListMain>{

  var nameArray = [];
  var contactArray = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add List"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text("Enter Name")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: contactController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text("Enter Contact No.")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 200,
                height: 50,
                color: Colors.blueGrey,
                child: TextButton(onPressed: (){
                  if(nameController.text==""){
                    print("Name Required");
                  }
                  else{
                    addData();
                  }
                }, child: Text("Submit", style: TextStyle(color: Colors.white),))),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nameArray.length,
                itemBuilder: (context,index){
                  return Padding(
                padding: EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                        children: [
                          Text(nameArray[index]),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(contactArray[index]),
                          ),
                        ],
                      ),
                ),
              );
                }),
            )
          ],
        ),
      ),
    );
  }

  addData() async{
    setState(() {
      nameArray.add(nameController.text);
      contactArray.add(contactController.text);
      nameController.clear();
      contactController.clear();
      print(nameArray);
    });
  }

}