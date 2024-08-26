import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../model/app_model.dart';
import '../../../model/task.dart';
import '../../../model/task_category.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});
  final x = GetIt.I.get<AppModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TaskSectionView(
            sectionTitle: 'TO-DO',
            children: x.tasks
                .where((task) => task.isCompleted == false)
                .toList()
                .map((task) => _TaskItemView(task: task))
                .toList(),
          ),
          const SizedBox(height: 16),
          _TaskSectionView(
            sectionTitle: 'COMPLETED',
            children: x.tasks
                .where((task) => task.isCompleted == true)
                .toList()
                .map((task) => _TaskItemView(task: task))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TaskSectionView extends StatelessWidget {
  const _TaskSectionView(
      {super.key, required this.sectionTitle, required this.children});

  final String sectionTitle;
  final List<_TaskItemView> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

class _TaskItemView extends StatelessWidget {
  final x = GetIt.I.get<AppModel>();

  _TaskItemView({
    required this.task,
  }) {
    category = x.categories.firstWhere((cat) => cat.id == task.categoryId);
  }

  final Task task;
  late final TaskCategory category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(CupertinoIcons.circle_fill,
              size: 14, color: task.isCompleted ? Colors.green : Colors.red),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(category.iconData, size: 14, color: category.color),
                    const SizedBox(width: 8),
                    Text(task.title,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        )),
                    const Spacer(),
                    Row(
                      children: [
                        Text(task.time, style: const TextStyle(fontSize: 10)),
                        const Icon(CupertinoIcons.chevron_right),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
