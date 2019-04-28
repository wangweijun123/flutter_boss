import 'package:flutter/material.dart';
import '../model/Company.dart';
import 'company_inc.dart';
import 'company_hot_job.dart';
import '../component/indicator_viewpager.dart';
import 'company_info.dart';

const double _kAppbarHeight = 256;

class CompanyDetail extends StatefulWidget {
  final Company company;

  const CompanyDetail({Key key, @required this.company}) : super(key: key);

  @override
  _CompanyDetailState createState() {
    return new _CompanyDetailState();
  }
}

class _CompanyDetailState extends State<CompanyDetail>
        with TickerProviderStateMixin{
  List<Widget> _imagePages;
  List<String> _urls = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556383965594&di=c235020f6be72d9389bf2a4bb9c527c2&imgtype=0&src=http%3A%2F%2Fbpic.ooopic.com%2F13%2F69%2F58%2F44bOOOPIC57_1024.jpg%2521%2Ffw%2F780%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556383965593&di=9e09775ebc451327c16c3f7e46357343&imgtype=0&src=http%3A%2F%2Fdimg06.c-ctrip.com%2Fimages%2F35050r000000gro6xC1BB.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556383965593&di=08ae2461d674d8057d46e3d25df89948&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F014a8d59cbc695a8012053f8f4352c.jpg%401280w_1l_2o_100sh.png"
  ];

  Widget _companyTabContent;
  List<Tab> _tabs;
  TabController _controller;
  VoidCallback onChanged;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    if (!_urls.isEmpty) {
      _imagePages = <Widget>[];
      _urls.forEach((String url){
        _imagePages.add(
          new Container(
            color: Colors.black.withAlpha(900),
            child: new ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: new Image.network(
                  url,
                  fit: BoxFit.cover,
                  height: _kAppbarHeight,
                ),
            ),
          ),
        );
      });

      _tabs = [
        new Tab(text: '公司概括',),
        new Tab(text: '热招职位',)
      ];
      _companyTabContent = new CompanyInc(widget.company.inc);
      _controller = new TabController(
          length: _tabs.length, vsync: this);
      onChanged = (){
        setState(() {
          if (_currentIndex == 0) {
            _companyTabContent = new CompanyInc(widget.company.inc);
          } else {
            _companyTabContent = new CompanyHotJob();
          }

          _currentIndex = _controller.index;
        });
      };
      _controller.addListener(onChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new Stack(
        children: <Widget>[
          new SingleChildScrollView(
            child: new Column(
              children: <Widget>[

                new SizedBox.fromSize(
                  size: Size.fromHeight(_kAppbarHeight),
                  // 带三个点的图片
                  child: new IndicatorViewPager(_imagePages),
                ),

                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new CompanyInfo(company: widget.company),
                      new Divider(),
                      new TabBar(
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: new TextStyle(fontSize: 16),
                        labelColor: Colors.black,
                        controller: _controller,
                        tabs: _tabs,
                        indicatorColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),

                _companyTabContent
              ],
            ),
          ),

          new Positioned(
            top: 10.0,
              left: -10.0,
              child: new Container(
                padding: EdgeInsets.all(15.0),
                child: new BackButton(color: Colors.white,),
              ),
          ),


        ],
      ),
    );
  }
}
