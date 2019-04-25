import 'package:meta/meta.dart';
import 'dart:convert';

class Job {
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;

  Job({this.name, this.cname, this.size, this.salary, this.username, this.title});


  static List<Job> fromJson(String json) {
    List<Job> _jobs = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapdata = decoder.convert(json)['list'];
    for (var obj in mapdata) {
      Job job = new Job(
          name: obj['name'],
          cname : obj['cname'],
          size : obj['size'],
          salary : obj['salary'],
          username : obj['username'],
          title : obj['title']);
      _jobs.add(job);
    }

    return _jobs;
  }
}