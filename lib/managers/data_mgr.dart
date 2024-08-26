import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactions_app/model/task_category.dart';
import '../model/enum/time_period.dart';
import '../model/task.dart';

class DataMgr {
  List<Task> allTasks = [];
  List<TaskCategory> categories = [];

  bool? selectedStatus;
  int? selectedId;
  TimePeriod? selectedPeriod;

  DataMgr() {
    _fetchData();
  }

  List<Task> get filteredTasks => _filterTasks();

  double get taskCompletionPercentage {
    int completed =
        filteredTasks.where((task) => task.isCompleted).toList().length;
    int total = filteredTasks.length;
    return completed / total;
  }

  void _fetchData() {
    _fetchTasks();
    _fetchCategories();
  }

  void _fetchTasks() {
    allTasks = [
      Task(
          id: 1,
          title: 'Webinar on Machine Learning',
          isCompleted: false,
          timeStamp: DateTime.now().add(const Duration(hours: 2)),
          categoryId: 1),
      Task(
          id: 2,
          title: 'Buy Coffee',
          isCompleted: true,
          timeStamp: DateTime.now().add(const Duration(hours: 5, minutes: 15)),
          categoryId: 2),
      Task(
          id: 3,
          title: 'Daily UI Change',
          isCompleted: true,
          timeStamp: DateTime.now().add(const Duration(hours: 6, minutes: 15)),
          categoryId: 3),
      Task(
          id: 4,
          title: 'Project with team',
          isCompleted: false,
          timeStamp: DateTime.now().add(const Duration(days: 1)),
          categoryId: 3),
      Task(
          id: 5,
          title: 'Webinar on Database Design',
          isCompleted: true,
          timeStamp: DateTime.now().add(const Duration(days: 2)),
          categoryId: 1),
    ];
  }

  void _fetchCategories() {
    categories = [
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

  List<Task> _filterTasks() {
    List<Task> temp = allTasks;

    if (selectedPeriod != null) {
      temp = temp
          .where((task) => task.timeStamp.isBefore(
              DateTime.now().add(Duration(days: selectedPeriod!.duration()))))
          .toList();
    }

    if (selectedStatus != null) {
      temp = temp.where((task) => task.isCompleted == selectedStatus).toList();
    }

    if (selectedId != null) {
      temp = temp.where((task) => task.categoryId == selectedId).toList();
    }

    return temp;
  }

  changeTaskCompletionState({required int id}) {
    var task = allTasks.where((task) => task.id == id).firstOrNull;
    if (task != null) {
      task.isCompleted = !task.isCompleted;
    }
  }
}
