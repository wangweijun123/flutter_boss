import 'package:meta/meta.dart';
import 'dart:convert';

class Company {
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  Company({this.logo, this.name, this.location, this.type, this.size,
      this.employee, this.hot, this.count, this.inc});

  static List<Company> fromJson(String json) {
    List<Company> _jobs = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapdata = decoder.convert(json)['list'];
    for (var obj in mapdata) {
      Company company = new Company(
          logo: obj['logo'],
          name: obj['name'],
          location: obj['location'],
          type: obj['type'],
          size: obj['size'],
          employee: obj['cmployee'],
          hot: obj['hot'],
          count: obj['count']
      );
      _jobs.add(company);
    }

    return _jobs;
  }
}
