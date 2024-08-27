import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interactions_app/extensions/text_ext.dart';
import 'package:interactions_app/model/task_category.dart';
import '../../../managers/data_mgr.dart';

class CategoryTabView extends StatelessWidget {
  CategoryTabView({super.key});
  final dataMgr = GetIt.I.get<DataMgr>();

  void _selectCategory(TaskCategory cat) {
    dataMgr.selectedCategory = dataMgr.selectedCategory == cat ? null : cat;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dataMgr.categories.length,
      child: TabBar(
        tabs: dataMgr.categories
            .map(
              (cat) => InkWell(
                child: _TabItemCard(
                  icon: Icon(cat.icon, color: cat.color()),
                  title: cat.title,
                  numItems: 5,
                ),
                onTap: () => _selectCategory(cat),
              ),
            )
            .toList(),
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        labelPadding: const EdgeInsets.symmetric(
            horizontal: 8.0), // Reduce horizontal padding between tabs
        onTap: (index) => (),
      ),
    );
  }
}

class _TabItemCard extends StatelessWidget {
  const _TabItemCard({
    required this.icon,
    required this.title,
    required this.numItems,
  });

  final Icon icon;
  final String title;
  final int numItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title).styled(size: 16, weight: FontWeight.w600),
                Text('${numItems.toString()} items')
                    .styled(size: 12, weight: FontWeight.w400),
              ],
            )
          ],
        ),
      ),
    );
  }
}
