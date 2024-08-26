import 'package:flutter/material.dart';
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
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.greenAccent,
                                    color: Colors.green,
                                    minHeight: 7,
                                    value: 0.5,
                                    semanticsLabel: 'Linear progress indicator',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '50% Completed',
                                  style: TextStyle(fontSize: 10),
                                ),
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
