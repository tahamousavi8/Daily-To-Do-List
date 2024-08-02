// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:to_do_app/pages/about_us.dart';
import 'package:to_do_app/pages/home_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  List<ScreenHiddenDrawer> _pages = [];
  final _textStyle = TextStyle(fontWeight: FontWeight.bold);
  @override
  void initState() {
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Daily To Do List',
              selectedStyle: _textStyle,
              baseStyle: _textStyle,
              colorLineSelected: Colors.white),
          HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'About Us',
              selectedStyle: _textStyle,
              baseStyle: _textStyle,
              colorLineSelected: Colors.white),
          AboutUs())
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.deepPurple,
      backgroundColorAppBar: Colors.deepPurple[400],
    );
  }
}
