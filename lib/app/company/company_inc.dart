import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {
  final String companyInc;

  const CompanyInc( this.companyInc);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10.0,),
        child: new Container(
          color: Colors.white,
          child: new Padding(
            padding: EdgeInsets.all(15.0,),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(10.0,),
                      child: new Text('公司介绍\ndddd\ndd\ndddd\nddddd\ndd\ndddd\ndddd\neeee', style: new TextStyle(fontSize: 20.0),),

                    ),
                  ],
                ),

                new RichText(
                    text: new TextSpan(
                        text: companyInc,
                        style: new TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                    ),
                )

              ],
            ),
          ),
        ),
    );
  }
}
