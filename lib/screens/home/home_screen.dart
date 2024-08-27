import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interactions_app/extensions/text_ext.dart';
import 'package:interactions_app/reusable_components/header_container.dart';
import 'package:interactions_app/screens/home/subviews/category_tab_view.dart';
import 'package:interactions_app/screens/home/subviews/days_tab_view.dart';
import 'package:interactions_app/screens/home/subviews/task_list.dart';
import '../../managers/navigation_mgr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navMgr = GetIt.I.get<NavMgr>();

  void _navigate(BuildContext context) {
    navMgr.navigate(context, Destination.addTask).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderContainer(
            title: "Let's Plan",
            subtitle: 'My Schedule',
            bottom: CategoryTabView(),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Text('Add Task').styled(weight: FontWeight.bold),
                const Spacer(),
                IconButton(
                  onPressed: () => _navigate(context),
                  icon: const Icon(
                    CupertinoIcons.plus_circle_fill,
                    color: Colors.blue,
                    size: 32,
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
