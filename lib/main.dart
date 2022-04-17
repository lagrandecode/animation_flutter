

import 'package:animation_flutter/next_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  AnimationController? controller;
  Animation? _animation;

  // create animation to move the logo from zero to 300
  // first we pass the animaction  controller
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: 300).animate(controller!)..addListener(() {
      setState(() {


      });
    });
    controller!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: _animation!.value,
              width: _animation!.value,
              child: FlutterLogo(),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NextPage()));
            },
            child: Text("next Page", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
          )
        ],
      )
    );
  }
}

