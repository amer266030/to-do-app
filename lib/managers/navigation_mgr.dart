import 'package:flutter/material.dart';
import 'package:interactions_app/screens/add_category/add_category_screen.dart';
import '../screens/add_task/add_task_screen.dart';

class NavMgr {
  void navigate(BuildContext context, Destination dest) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => getDestination(dest)));
  }

  void navigateBack(BuildContext context) => Navigator.pop(context);

  Widget getDestination(Destination dest) {
    switch (dest) {
      case Destination.addCategory:
        return AddCategoryScreen();
      case Destination.addTask:
        return AddTaskScreen();
    }
  }
}

enum Destination { addTask, addCategory }
