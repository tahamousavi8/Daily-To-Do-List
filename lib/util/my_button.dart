import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback onClick;
  MyButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text('Add Task'),
      style: ElevatedButton.styleFrom(
          elevation: 15,
          minimumSize: Size(double.infinity, 50),
          foregroundColor: Colors.black),
    );
  }
}
