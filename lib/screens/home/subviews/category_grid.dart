import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../model/app_model.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});
  final x = GetIt.I.get<AppModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: x.categories
              .map(
                (cat) => _GridCard(
                  icon: Icon(cat.iconData, color: cat.color),
                  title: cat.title,
                  numItems: 5,
                ),
              )
              .toList()),
    );
  }
}

class _GridCard extends StatelessWidget {
  const _GridCard({
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                Text('${numItems.toString()} items',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
