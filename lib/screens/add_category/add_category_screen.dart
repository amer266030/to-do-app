import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interactions_app/model/task_category.dart';
import 'package:interactions_app/reusable_components/custom_text_field.dart';
import '../../managers/data_mgr.dart';
import '../../managers/navigation_mgr.dart';
import '../../model/enum/drop_down_colors.dart';
import '../../model/enum/drop_down_icons.dart';
import '../../reusable_components/custom_btn.dart';
import '../../reusable_components/header_container.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final dataMgr = GetIt.I.get<DataMgr>();
  final navMgr = GetIt.I.get<NavMgr>();
  final textController = TextEditingController();
  String selectedIcon = DropDownIcons.values.first.name;
  String selectedColor = DropDownColors.values.first.name;

  void _setSelectedIcon(String icon) => setState(() {
        selectedIcon = icon;
      });

  void _setSelectedColor(String color) => setState(() {
        selectedColor = color;
      });

  void addCategory(TaskCategory category) async {
    await dataMgr.addNewCategory(category);
    navMgr.navigateBack(context, category.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderContainer(
            title: 'Add Category',
            subtitle: 'New Category',
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: textController, hint: 'Category Name'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text('Icon:'),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 1,
                            child: DropdownButton(
                              value: selectedIcon,
                              items: DropDownIcons.values
                                  .map(
                                    (icon) => DropdownMenuItem(
                                      value: icon.name,
                                      child: Row(
                                        children: [
                                          Icon(icon.icon()),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              itemHeight: 60,
                              onChanged: (value) => _setSelectedIcon(value!),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(flex: 1, child: Text('Color:')),
                          const Spacer(),
                          Expanded(
                            flex: 1,
                            child: DropdownButton(
                              value: selectedColor,
                              items: DropDownColors.values
                                  .map(
                                    (c) => DropdownMenuItem(
                                      value: c.name,
                                      child: Row(
                                        children: <Icon>[
                                          Icon(CupertinoIcons.square_fill,
                                              color: c.color()),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              itemHeight: 60,
                              onChanged: (value) => _setSelectedColor(value!),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                CustomBtn(
                  title: 'Cancel',
                  action: () =>
                      navMgr.navigateBack(context, 'No Category Added'),
                  color: Colors.red,
                ),
                const SizedBox(width: 16),
                CustomBtn(
                    title: 'Add Category',
                    action: () => addCategory(TaskCategory(
                        id: Random().nextInt(500),
                        title: textController.text,
                        iconName: selectedIcon,
                        colorName: selectedColor)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
