import 'package:flutter/material.dart';
import 'package:interactions_app/services/di_container.dart';
import 'screens/home/home_screen.dart';

void main() {
  DIContainer.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
