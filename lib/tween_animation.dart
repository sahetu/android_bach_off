import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class TweenMain extends StatefulWidget{

  @override
  TweenState createState() => TweenState();

}

class TweenState extends State<TweenMain>{

  MovieTween TweenAnimation = MovieTween()
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('width',Tween(begin: 0.0,end: 200.0))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('height',Tween(begin: 0.0,end: 400.0))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('width',Tween(begin: 200.0,end: 400.0))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('height',Tween(begin: 400.0,end: 800.0))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('color',ColorTween(begin: Colors.white,end: Colors.red))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('color',ColorTween(begin: Colors.red,end: Colors.blue))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 3000))
                          .tween('textSize',Tween(begin: 10.0,end: 50.0))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('textcolor',ColorTween(begin: Colors.blue,end: Colors.red))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('textcolor',ColorTween(begin: Colors.red,end: Colors.white))
                        ..scene(
                          begin: Duration(microseconds: 3000),
                          duration: Duration(milliseconds: 4500))
                          .tween('width',Tween(begin: 400.0,end: 200.0))
                        ..scene(
                          begin: Duration(microseconds: 3000),
                          duration: Duration(milliseconds: 4500))
                          .tween('height',Tween(begin: 800.0,end: 400.0))
                        ..scene(
                          begin: Duration(microseconds: 4500),
                          duration: Duration(milliseconds: 6000))
                          .tween('width',Tween(begin: 200.0,end: 50.0))
                        ..scene(
                          begin: Duration(microseconds: 4500),
                          duration: Duration(milliseconds: 6000))
                          .tween('height',Tween(begin: 400.0,end: 50.0))
                        ..scene(
                          begin: Duration(microseconds: 3000),
                          duration: Duration(milliseconds: 4500))
                          .tween('color',ColorTween(begin: Colors.white,end: Colors.red))
                        ..scene(
                          begin: Duration(microseconds: 4500),
                          duration: Duration(milliseconds: 6000))
                          .tween('color',ColorTween(begin: Colors.red,end: Colors.blue))
                        ..scene(
                          begin: Duration(microseconds: 3000),
                          duration: Duration(milliseconds: 6000))
                          .tween('textSize',Tween(begin: 50.0,end: 10.0))
                        ..scene(
                          begin: Duration(microseconds: 3000),
                          duration: Duration(milliseconds: 4500))
                          .tween('textcolor',ColorTween(begin: Colors.blue,end: Colors.red))
                        ..scene(
                          begin: Duration(microseconds: 4500),
                          duration: Duration(milliseconds: 6000))
                          .tween('textcolor',ColorTween(begin: Colors.red,end: Colors.white));
  
MovieTween ReverseTweenAnimation = MovieTween()
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('width',Tween(begin: 400.0,end: 200.0))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('height',Tween(begin: 800.0,end: 400.0))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('width',Tween(begin: 200.0,end: 50.0))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('height',Tween(begin: 400.0,end: 50.0))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('color',ColorTween(begin: Colors.white,end: Colors.red))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('color',ColorTween(begin: Colors.red,end: Colors.blue))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 3000))
                          .tween('textSize',Tween(begin: 50.0,end: 10.0))
                        ..scene(
                          begin: Duration(microseconds: 0),
                          duration: Duration(milliseconds: 1500))
                          .tween('textcolor',ColorTween(begin: Colors.blue,end: Colors.red))
                        ..scene(
                          begin: Duration(microseconds: 1500),
                          duration: Duration(milliseconds: 3000))
                          .tween('textcolor',ColorTween(begin: Colors.red,end: Colors.white))

                        ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
      ),
      body: Container(
        child: Row(
          children: [
            PlayAnimationBuilder(
              tween: TweenAnimation, 
              duration: TweenAnimation.duration, 
              builder: ((context, value, child) {
                return Container(
                  width: value.get('width'),
                  height: value.get('height'),
                  color: value.get('color'),
                  child: Container(
                    child: Center(
                      child: Text('Hello', style: TextStyle(
                        fontSize: value.get("textSize"),
                        color: value.get("textcolor")
                      ),),
                    ),
                  ),
                );
              })
            )
          ],
        ),
      ),
    );
  }

}