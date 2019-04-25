import 'package:flutter/material.dart';
import 'dart:async';
import 'home/home.dart';

/**
 * 闪屏页
 */
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() {
    return new _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer(Duration(seconds: 3),(){
      // 跳转主页
      print("跳转主页");
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context){
            return new BossApp();
          }
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
          padding: EdgeInsets.only(top: 200.0),
          child: Column(// column默认是剧中的
            children: <Widget>[
              Text('boss 直聘',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ],
          )
      ),
    );
  }
}
