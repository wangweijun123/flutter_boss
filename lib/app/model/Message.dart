import 'package:flutter/material.dart';
import 'dart:convert';

class Message {
  final String name;
  final String avater;
  final String size;
  final String salary;
  final String username;
  final String title;

  Message({@required this.name, @required this.avater, @required this.size, @required this.salary, @required this.username, this.title});


  static List<Message> fromJson(String json) {
    List<Message> _messages = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapdata = decoder.convert(json);
    for (var obj in mapdata) {
      Message job = new Message(
          name: obj['name'],
          avater : obj['avater'],
          size : obj['size'],
          salary : obj['salary'],
          username : obj['username'],
          title : obj['title']);
      _messages.add(job);
    }
    return _messages;
  }
}