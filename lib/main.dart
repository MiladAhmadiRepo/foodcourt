import 'package:flutter/material.dart';
import 'package:foodcourt/screens/food_concept_home.dart';
import 'package:foodcourt/utils/scroll_class.dart';
import 'package:foodcourt/utils/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: 'FoodCourt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: FoodConceptHome(),
    );
  }
}
