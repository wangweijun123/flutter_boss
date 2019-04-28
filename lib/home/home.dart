import 'package:flutter/material.dart';
import '../app/component/icon_table.dart';
import '../app/view/Jobs_view.dart';
import '../app/view/my_view.dart';
//import '../job/job_list.dart';
 const double _kTabTextSize = 11.0;

 const int INDEX_JOB = 0;
 const int INDEX_COMPANY = 1;
 const int INDEX_MESSAGE = 2;
 const int INDEX_MAIN = 3;
  Color _kPrimaryColor = new Color.fromARGB(255, 0, 215, 198);


class BossApp extends StatefulWidget {

  @override
  _BossAppState createState() {
    return new _BossAppState();
  }

}

class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;

  TabController _controller;
  VoidCallback onChanged;
  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex:_currentIndex, length: 4, vsync: this);

    onChanged = () {
      setState(() {
        _currentIndex = _controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        // 注意這兩個地方都要加controller
        controller: _controller,
        children: <Widget>[
          /*new JobList(),
          new JobList(),
          new JobList(),
          new JobList(),*/
          new JobsTab(),
          new JobsTab(),
          new JobsTab(),
          new MineTab(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.white,
        child: TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: new TextStyle(fontSize: _kTabTextSize),
            tabs: <IconTab>[
          IconTab(
              text: "职位",
              icon: _currentIndex == INDEX_JOB?
              "assets/images/ic_main_tab_company_pre.png":"assets/images/ic_main_tab_company_nor.png",
              color: _currentIndex == INDEX_JOB? _kPrimaryColor : Colors.grey[900]),

          IconTab(
              text: "公司",
              icon: _currentIndex == INDEX_COMPANY?
              "assets/images/ic_main_tab_contact_pre.png":"assets/images/ic_main_tab_contact_nor.png",
              color: _currentIndex == INDEX_COMPANY? _kPrimaryColor : Colors.grey[900]),

          IconTab(
              text: "职位",
              icon: _currentIndex == INDEX_MESSAGE?
              "assets/images/ic_main_tab_find_pre.png":"assets/images/ic_main_tab_find_nor.png",
              color: _currentIndex == INDEX_MESSAGE? _kPrimaryColor : Colors.grey[900]),

          IconTab(
              text: "职位",
              icon: _currentIndex == INDEX_MAIN?
              "assets/images/ic_main_tab_me_pre.png":"assets/images/ic_main_tab_me_nor.png",
              color: _currentIndex == INDEX_MAIN? _kPrimaryColor : Colors.grey[900]),

        ]),
      ),

    );
  }
}