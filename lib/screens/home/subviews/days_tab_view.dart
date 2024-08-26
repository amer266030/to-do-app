import 'package:flutter/material.dart';
import 'package:interactions_app/extensions/text_ext.dart';
import '../../../model/enum/time_period.dart';

class DaysTabView extends StatelessWidget {
  const DaysTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TabBar(
              tabs: TimePeriod.values
                  .map((timePeriod) => Text(timePeriod.text()))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AspectRatio(
                aspectRatio: 5,
                child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.cyan.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Status')
                                .styled(size: 12, weight: FontWeight.w500),
                            Row(
                              children: [
                                const Expanded(
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.greenAccent,
                                    color: Colors.green,
                                    minHeight: 7,
                                    value: 0.5,
                                    semanticsLabel: 'Linear progress indicator',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('50% Completed').styled(size: 10),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.directions_transit),
                    const Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
