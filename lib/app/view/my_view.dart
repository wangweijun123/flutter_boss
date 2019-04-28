import 'package:flutter/material.dart';

class MineTab extends StatelessWidget{
  final double _appBarHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new DecoratedBox(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.4),
                        colors: <Color>[
//                          Colors.white, Colors.black
                          Color(0x00000000), Color(0x00000000)
                        ],
                      )
                    ),
                  ),

                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.all(20),
                        child: new CircleAvatar(
                          radius: 40,
                          backgroundImage: new NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556383965594&di=c235020f6be72d9389bf2a4bb9c527c2&imgtype=0&src=http%3A%2F%2Fbpic.ooopic.com%2F13%2F69%2F58%2F44bOOOPIC57_1024.jpg%2521%2Ffw%2F780%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue"),
                        ),
                      ),

                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.all(30),
                          ),
                          new Text('哈哈你好',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),

                          new Text('在职-考虑机会',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),


                        ],
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),

          // 沟通过，已通过
          new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  new Container(
                    color:Colors.green,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        // 剩下的空间均分
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new _ContactItem(
                            callback: (){
                              showDialog(
                                context: context,
                                child: AlertDialog(title: new Text('沟通过'),)
                              );
                            },
                            count: '500',
                            title: '沟通过',
                          ),
                          new _ContactItem(
                            callback: (){
                              showDialog(
                                  context: context,
                                  child: AlertDialog(title: new Text('面试过'),)
                              );
                            },
                            count: '10',
                            title: '面试过',
                          ),
                          new _ContactItem(
                            callback: (){

                            },
                            count: '36',
                            title: '聊天',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),

          /*new SliverFillRemaining(

            child: new Text('test',
              style: TextStyle(
                height: 300,
                color: Colors.green,
                backgroundColor: Colors.red,
              ),
            ),
          ),*/


        ],
      ),

    );
  }

}

class _ContactItem extends StatelessWidget{
  final String count;
  final String title;
  final VoidCallback callback;

  const _ContactItem({Key key, @required this.count, @required this.title, @required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: callback,
      child: Column(
        children: <Widget>[
          new Text(title,
            style: TextStyle(color: Colors.black),
          ),
          new Text(count,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}