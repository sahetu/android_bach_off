import 'package:flutter/material.dart';

class CustomListMain extends StatefulWidget{

  @override
  CustomListState createState() => CustomListState();

}

class CustomListState extends State<CustomListMain>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: "Custom List",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom List"),
        ),
        body: Container(
          child: CustomListData(),
        )
      ),
    );
  }

}

class CustomListData extends StatelessWidget{

  var nameArray = ["Android","Java","Kotlin","Flutter","React Native","Xamrin","ROR"];
  var subTitleArray = ["Android Application","Java Application","Kotlin Application","Cross Platform Application","Cross Platform Application","Cross Platform Application","Cross Platform Application"];
  var leadingIconArray = ["alert.png","badge.png","coin.png","correct.png","pause.png","user_vector.png","share.png"];
  var trailingIconArray = ["correct.png","pause.png","user_vector.png","share.png","alert.png","badge.png","coin.png"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return ListView.builder(
          itemCount: nameArray.length,
          itemBuilder: (context,position){
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 100, 
                        height: 100,
                        child: Image.asset("images/${trailingIconArray[position]}")),
                    ),
                    Column(
                      children: [
                        Text(nameArray[position]),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(subTitleArray[position]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
  }
  
}