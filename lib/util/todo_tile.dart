// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final bool isCompleted;
  final String taskName;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.isCompleted,
      required this.taskName,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 17),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            backgroundColor: Colors.red.shade300,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Card(
          elevation: 15,
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple[300]),
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
