import 'package:flutter/material.dart';
import '../model/Company.dart';

class CompanyInfo extends StatelessWidget{
  final Company company;

  const CompanyInfo({Key key, this.company}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10),
        child: new SizedBox(
          child: new Row(
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.all(10),
                  child: new Image.network(
                      company.logo,
                      width: 50,
                      height: 50,
                  ),
              ),

              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    new Container(
                      child: new Text(company.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),
                      ),
                      margin: EdgeInsets.all(10),
                    ),

                    new Padding(
                        padding: EdgeInsets.all(10),
                        child: new Text(company.location,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 30),
                        ),
                    ),

                    new Padding(
                      padding: EdgeInsets.all(10),
                      child: new Text(
                        company.type + " | " + company.size + " | " + company.employee,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }
}