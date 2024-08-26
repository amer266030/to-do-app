import 'package:flutter/material.dart';
import '../screens/add_task/add_task_screen.dart';

class NavMgr {
  void navigateToAddTask(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
  }

  void navigateToAddCategory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
  }

  void navigateBack(BuildContext context) => Navigator.pop(context);
}
