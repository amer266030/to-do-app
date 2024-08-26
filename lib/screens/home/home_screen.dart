import 'package:flutter/material.dart';
import 'package:interactions_app/screens/home/subviews/days_tab_view.dart';
import 'package:interactions_app/screens/home/subviews/task_list.dart';
import 'subviews/category_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const SafeArea(
                child: AspectRatio(
                  aspectRatio: 1.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's Plan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'My Schedule',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      CategoriesGrid(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: const [
              DaysTabView(),
              TaskList(),
            ],
          )),
        ],
      ),
    );
  }
}
