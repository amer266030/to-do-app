import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactions_app/reusable_components/header_container.dart';
import 'package:interactions_app/screens/home/subviews/days_tab_view.dart';
import 'package:interactions_app/screens/home/subviews/task_list.dart';
import '../add_task/add_task_screen.dart';
import 'subviews/category_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToAddTask(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _HeaderView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => _navigateToAddTask(context),
                  icon: const Icon(
                    CupertinoIcons.plus_circle_fill,
                    color: Colors.blue,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const DaysTabView(),
                TaskList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderView extends StatelessWidget {
  const _HeaderView();

  @override
  Widget build(BuildContext context) {
    return HeaderContainer(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'My Schedule',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        CategoriesGrid(),
      ],
    );
  }
}
