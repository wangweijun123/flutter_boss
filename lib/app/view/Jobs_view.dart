import 'package:flutter/material.dart';
import '../model/Job.dart';
import '../model/Company.dart';
import '../item/JobListItem.dart';
import '../company/company_detail.dart';

class JobsTab extends StatefulWidget {

  @override
  JobList createState() {
    return new JobList();
  }


}

class JobList extends State<JobsTab> {
  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();
    getJobList();
  }

  void getJobList() {
    String json = """
    {
      "list":[
      {
        "name": "架構師android",
        "cname": "螞蟻金服",
        "size": "B 輪",
        "salary": "25k-35k",
        "username": "claima",
        "title": "HR"
      },
      {
        "name": "JAVA",
        "cname": "百度",
        "size": "B 輪",
        "salary": "10k-35k",
        "username": "sksmile",
        "title": "HR"
      },
      {
        "name": "c++",
        "cname": "螞蟻金服",
        "size": "B 輪",
        "salary": "25k-35k",
        "username": "claima",
        "title": "HR"
      }
      ]
    }
    
    """;
    setState(() {
      _jobs = Job.fromJson(json);
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Android'),),
      body: new ListView.builder(itemCount: _jobs.length,itemBuilder: buildJobItem),
    );
  }

  Widget buildJobItem(BuildContext context, int index) {
    Job job = _jobs[index];
    var jobItem = new InkWell(
      onTap: (){
        /*showDialog(
          context: context,
          child: new AlertDialog(title: new Text('心情期待', style: new TextStyle(fontSize: 20),),),
        );*/
        // 跳转主页
        print("跳转主页");
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context){
              return new CompanyDetail(
                  company: new Company(
                      logo:"assets/images/ic_main_tab_company_pre.png",
                    name: "xx",
                    location: "hon",
                    type: "xx",
                    size: "xx",
                    employee: "employee",
                    hot: "hot",
                    count: "count",
                    inc: "inc",
                  ),

              );
            }
        ));

      },

      child: new JobListItem(job: job),
    );
    return jobItem;
  }
}

/*
final String logo;
final String name;
final String location;
final String type;
final String size;
final String employee;
final String hot;
final String count;
final String inc;*/
