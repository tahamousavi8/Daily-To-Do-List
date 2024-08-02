import 'package:hive/hive.dart';

class DatabaseModel {
  List tasks = [];
  final box = Hive.box('database');

  void firstTime() {
    tasks = [
      ['Call my Mom', false]
    ];
  }

  void loadData() {
    tasks = box.get('TODOLIST');
  }

  void updateData() {
    box.put('TODOLIST', tasks);
  }
}
