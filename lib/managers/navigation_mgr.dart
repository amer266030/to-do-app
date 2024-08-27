import 'package:flutter/material.dart';
import 'package:interactions_app/screens/add_category/add_category_screen.dart';
import '../screens/add_task/add_task_screen.dart';

class NavMgr {
  navigate(BuildContext context, Destination dest) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => getDestination(dest)))
        .then((value) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(value.toString())));
    });
  }

  void navigateBack(BuildContext context, String str) =>
      Navigator.pop(context, str);

  Widget getDestination(Destination dest) {
    switch (dest) {
      case Destination.addCategory:
        return const AddCategoryScreen();
      case Destination.addTask:
        return const AddTaskScreen();
    }
  }
}

// MARK: - Update getDestination() when a new view is added

enum Destination { addTask, addCategory }
