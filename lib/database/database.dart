import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference the box
  final _mybox = Hive.box("mybox");

  // run this method if this is the first time every opening this app
  void createInitiateData() {
    toDoList = [
      ["Learn Flutter", true],
      ["Learn French", false],
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
