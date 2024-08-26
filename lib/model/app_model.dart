import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactions_app/model/task_category.dart';
import 'task.dart';

class AppModel {
  List<Task> tasks = [
    Task(
        id: 1,
        title: 'Webinar on Machine Learning',
        isCompleted: false,
        time: '10:30AM',
        categoryId: 1),
    Task(
        id: 2,
        title: 'Buy Coffee',
        isCompleted: true,
        time: '12:40PM',
        categoryId: 2),
    Task(
        id: 3,
        title: 'Daily UI Change',
        isCompleted: true,
        time: '12:40PM',
        categoryId: 3),
    Task(
        id: 4,
        title: 'Project with team',
        isCompleted: false,
        time: '1:30PM',
        categoryId: 3),
    Task(
        id: 5,
        title: 'Webinar on Database Design',
        isCompleted: true,
        time: '12:15AM',
        categoryId: 1),
  ];
  List<TaskCategory> categories = [
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

  changeTaskCompletionState({required int id}) {
    var task = tasks.where((task) => task.id == id).firstOrNull;
    if (task != null) {
      task.isCompleted = !task.isCompleted;
    }
  }
}
