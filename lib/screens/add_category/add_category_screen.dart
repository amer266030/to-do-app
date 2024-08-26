import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interactions_app/reusable_components/custom_text_field.dart';
import '../../managers/data_mgr.dart';
import '../../managers/navigation_mgr.dart';
import '../../reusable_components/custom_btn.dart';
import '../../reusable_components/header_container.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});

  final dataMgr = GetIt.I.get<DataMgr>();
  final navMgr = GetIt.I.get<NavMgr>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderContainer(
            title: 'Add Category',
            subtitle: '',
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                  child: Column(
                    children: [CustomTextField(hint: 'Category Name')],
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
                  action: () => navMgr.navigateBack(context),
                  color: Colors.red,
                ),
                const SizedBox(width: 16),
                CustomBtn(title: 'Add Category', action: () => ())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
