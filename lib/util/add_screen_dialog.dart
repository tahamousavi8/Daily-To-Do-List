// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class AddScreenDialog extends StatelessWidget {
  //text
  TextEditingController newTask = TextEditingController();
  VoidCallback onSaved;
  AddScreenDialog({super.key, required this.newTask, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.deepPurple[300],
      content: Container(
        height: 200,
        // decoration:
        //     BoxDecoration(border: Border.all(width: 0), color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: newTask,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter the task name...',
                  prefixIcon: Icon(Icons.task),
                  prefixIconColor: Colors.black,
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              MyButton(onClick: onSaved)
            ],
          ),
        ),
      ),
    );
  }
}
