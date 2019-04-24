import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
          padding: EdgeInsets.only(top: 111.0),
          child: Column(// column默认是剧中的
            children: <Widget>[
              Text('boss 直聘'),
            ],
          )
      ),
    );
  }
}
