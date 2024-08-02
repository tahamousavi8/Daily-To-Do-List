// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/drawer_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('database');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily To Do List',
      home: DrawerPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
