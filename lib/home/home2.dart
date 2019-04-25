import 'package:flutter/material.dart';
import '../app/component/icon_table.dart';
import '../job/job_list.dart';

class BossApp extends StatefulWidget {
   static const int INDEX_JOB = 0;
   static const int INDEX_COMPANY = 1;
   static const int INDEX_MESSAGE = 2;
   static const int INDEX_MAIN = 3;

  @override
  _BossAppState createState() {
    return new _BossAppState();
  }

}

class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin{
  int _currentIndx = 0;

  TabController _controller;
  VoidCallback voidCallback;
  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex:_currentIndx, length: 4, vsync: this);

    voidCallback = () {
      setState(() {
        _currentIndx = _controller.index;
      });
    };
    _controller.addListener(voidCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('boss 直聘'),),
      bottomNavigationBar: TabBar(tabs: <IconTab>[
        IconTab(text: "职位", icon: "", color: Colors.black),
        IconTab(text: "职位", icon: "", color: Colors.black),
        IconTab(text: "职位", icon: "", color: Colors.black),
        IconTab(text: "职位", icon: "", color: Colors.black),
      ]),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          JobList(),
          JobList(),
          JobList(),
          JobList(),
        ],
      ),
    );
  }
}