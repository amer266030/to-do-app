import 'dart:math';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interactions_app/extensions/text_ext.dart';
import 'package:interactions_app/model/task_category.dart';
import 'package:interactions_app/reusable_components/header_container.dart';
import '../../managers/data_mgr.dart';
import '../../managers/navigation_mgr.dart';
import '../../model/task.dart';
import '../../reusable_components/custom_btn.dart';
import '../../reusable_components/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late DataMgr dataMgr = GetIt.I.get<DataMgr>();

  final navMgr = GetIt.I.get<NavMgr>();

  final nameController = TextEditingController();

  final descriptionController = TextEditingController();

  TaskCategory selectedCategory = DataMgr().categories.first;

  String selectedDate = DateTime.now().toIso8601String();

  void _setSelectedCategory(String title) {
    setState(() {
      selectedCategory =
          dataMgr.categories.where((cat) => cat.title == title).toList().first;
    });
  }

  void _navigate(BuildContext context) {
    navMgr.navigate(context, Destination.addCategory).then((_) {
      setState(() {});
    });
  }

  void addTask(Task task) {
    dataMgr.addNewTask(task);
    navMgr.navigateBack(context, task.title);
  }

  void setSelectedDate(DateTime date) => selectedDate = date.toIso8601String();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderContainer(
            title: 'Add Task',
            subtitle: 'Date',
            bottom: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: DatePicker(
                DateTime.now(),
                height: 95,
                daysCount: 30,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black54,
                selectedTextColor: Colors.white,
                onDateChange: (date) => setSelectedDate(date),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
            child: Row(
              children: [
                const Text('Add Category').styled(),
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
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      // Add Category
                      // Category Selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Selected Category').styled(),
                          DropdownButton(
                            value: selectedCategory.title,
                            items: dataMgr.categories
                                .map(
                                  (cat) => DropdownMenuItem(
                                    value: cat.title,
                                    child: Row(
                                      children: [
                                        Icon(cat.icon),
                                        const SizedBox(width: 8),
                                        Text(cat.title)
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            itemHeight: 60,
                            onChanged: (value) => _setSelectedCategory(value!),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            const Text('Task Name:').styled(size: 12),
                            const SizedBox(width: 8),
                            Expanded(
                                child: CustomTextField(
                                    controller: nameController, hint: 'Name'))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Description:').styled(size: 12),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomTextField(
                                  controller: descriptionController,
                                  hint: 'Description',
                                  maxLines: 5),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                CustomBtn(
                  title: 'Cancel',
                  action: () => navMgr.navigateBack(context, null),
                  color: Colors.red,
                ),
                const SizedBox(width: 16),
                CustomBtn(
                    title: 'Add Task',
                    action: () => addTask(Task(
                        id: Random().nextInt(500),
                        title: nameController.text,
                        isCompleted: false,
                        timeStamp: selectedDate,
                        categoryId: selectedCategory.id)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
