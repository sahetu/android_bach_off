import 'package:flutter/material.dart';

class ListMain extends StatefulWidget{

  @override
  ListState createState() => ListState();

}

class ListState extends State<ListMain>{

  var nameArray = ["Android","Java","Kotlin","Flutter","React Native","Xamrin","ROR"];
  var subTitleArray = ["Android Application","Java Application","Kotlin Application","Cross Platform Application","Cross Platform Application","Cross Platform Application","Cross Platform Application"];
  var leadingIconArray = ["alert.png","badge.png","coin.png","correct.png","pause.png","user_vector.png","share.png"];
  var trailingIconArray = ["correct.png","pause.png","user_vector.png","share.png","alert.png","badge.png","coin.png"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Simple List",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple List"),
        ),
        body: ListView.builder(
          itemCount: nameArray.length,
          itemBuilder: (context,position){
            return ListTile(
              title: Text(nameArray[position]),
              subtitle: Text(subTitleArray[position]),
              leading: Image.asset("images/${leadingIconArray[position]}"),
              trailing: Image.asset("images/${trailingIconArray[position]}"),
            );
          }),
      ),
    );
  }

}