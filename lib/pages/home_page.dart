import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/database.dart';
import 'package:to_do_app/util/add_screen_dialog.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:confetti/confetti.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Model database-------------------------------------------------
  DatabaseModel db = DatabaseModel();

  final _database = Hive.box('database');
  final _controller = TextEditingController();

  void addTask() {
    setState(() {
      db.tasks.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateData();
  }

//Checkbox Controller---------------------------------------------------
  void checkTask(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = value;
    });

    if (db.tasks[index][1] == true) {
      _confettiController.play();
    }
    db.updateData();
  }

  @override
  void dispose() {
    db.updateData();

    _confettiController.stop();

    super.dispose();
  }

  @override
  void initState() {
    if (_database.get('TODOLIST') == null) {
      db.firstTime();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //Add button controller-------------------------------------------
  void addButton() {
    showDialog(
      context: context,
      builder: (context) => AddScreenDialog(
        newTask: _controller,
        onSaved: addTask,
      ),
    );
  }

  //Remove task-----------------------------------------------------
  void removeTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateData();
  }

//Confetti Controller-----------------------------------------------
  final _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));
  // bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: -pi / 2,
            colors: const [Colors.deepPurple, Colors.yellow],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: db.tasks.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  isCompleted: db.tasks[index][1],
                  taskName: db.tasks[index][0],
                  onChanged: (value) => checkTask(value, index),
                  deleteFunction: (context) => removeTask(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[300],
        onPressed: addButton,
        child: const Icon(Icons.add),
      ),
    );
  }
}

