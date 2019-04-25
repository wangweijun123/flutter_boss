import 'package:flutter/material.dart';
import '../model/Job.dart';
import '../item/JobListItem.dart';

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
        showDialog(
          context: context,
          child: new AlertDialog(title: new Text('心情期待', style: new TextStyle(fontSize: 20),),),
        );
      },

      child: new JobListItem(job: job),
    );
    return jobItem;
  }
}