import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interactions_app/reusable_components/header_container.dart';
import '../../managers/data_mgr.dart';
import '../../managers/navigation_mgr.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final dataMgr = GetIt.I.get<DataMgr>();
  final navMgr = GetIt.I.get<NavMgr>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _HeaderView(),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      // Add Category
                      Row(
                        children: [
                          const Text(
                            'Add Category',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () =>
                                navMgr.navigateToAddCategory(context),
                            icon: const Icon(
                              CupertinoIcons.plus_circle_fill,
                              color: Colors.blue,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      // Category Selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Selected Category',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton(
                            items: dataMgr.categories
                                .map(
                                  (cat) => DropdownMenuItem(
                                    value: cat.title,
                                    child: Row(
                                      children: [
                                        Icon(cat.iconData),
                                        const SizedBox(width: 8),
                                        Text(cat.title)
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            itemHeight: 60,
                            onChanged: (value) => (),
                          )
                        ],
                      ),
                      // Task Name
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Task Name:',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 12.0,
                                    height: 2.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    'Task Name',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Task Description
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Description:',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 12.0,
                                    height: 2.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  label: Text('This is my Description',
                                      style: TextStyle(fontSize: 12)),
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 80),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => (),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Add Task'),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderView extends StatelessWidget {
  _HeaderView();

  final navMgr = GetIt.I.get<NavMgr>();

  @override
  Widget build(BuildContext context) {
    return HeaderContainer(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => navMgr.navigateBack(context),
                      icon: const Icon(CupertinoIcons.chevron_left,
                          color: Colors.white),
                    ),
                    const Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(CupertinoIcons.circle_fill,
                        color: Colors.transparent)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DatePicker(
                      DateTime.now(),
                      height: 95,
                      daysCount: 30,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black54,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) => (),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
