import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String title;
  bool isCompleted;
  String time;
  int categoryId;

  Task(
      {required this.title,
      required this.isCompleted,
      required this.time,
      required this.categoryId});

  static List<Task> tasks = [
    Task(
        title: 'Webinar on Machine Learning',
        isCompleted: false,
        time: '10:30AM',
        categoryId: 1),
    Task(
        title: 'Buy Coffee', isCompleted: true, time: '12:40PM', categoryId: 2),
    Task(
        title: 'Daily UI Change',
        isCompleted: true,
        time: '12:40PM',
        categoryId: 3),
    Task(
        title: 'Project with team',
        isCompleted: false,
        time: '1:30PM',
        categoryId: 3),
    Task(
        title: 'Webinar on Database Design',
        isCompleted: true,
        time: '12:15AM',
        categoryId: 1),
  ];
}

class TaskCategory {
  int id;
  String title;
  IconData iconData;
  Color color;

  TaskCategory(
      {required this.id,
      required this.title,
      required this.iconData,
      required this.color});

  static List<TaskCategory> categories = [
    TaskCategory(
        id: 1,
        title: 'Work',
        iconData: CupertinoIcons.doc_on_doc,
        color: Colors.orange),
    TaskCategory(
        id: 2,
        title: 'Shopping',
        iconData: CupertinoIcons.cart,
        color: Colors.blue),
    TaskCategory(
        id: 3,
        title: 'Projects',
        iconData: CupertinoIcons.bubble_left_bubble_right,
        color: Colors.deepPurple),
  ];
}
