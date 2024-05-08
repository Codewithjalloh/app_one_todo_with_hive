import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  // reference the box
  final _mybox = Hive.box("mybox");

  void createInitiateData() {
    toDoList = [
      ["Learn Flutter", true],
      ["Learn Dart", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  // update the database
  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
