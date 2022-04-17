import 'package:animation_flutter/third.dart';
import 'package:flutter/material.dart';


class NextPage extends StatefulWidget {
  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> with SingleTickerProviderStateMixin{
AnimationController? _controller;
Animation? _animation;

@override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller!.dispose();
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ThirdPage()));

      }
    });
    _controller!.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (BuildContext context, child){
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(_animation!.value, 0, 0),
            child: Center(
              child: Container(
                child: Text("Hello", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              ),
            )
          ),
        );

      },
    );
  }
}



















