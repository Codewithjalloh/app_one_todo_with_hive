import 'package:app_one_todo_with_hive/database/database.dart';
import 'package:app_one_todo_with_hive/util/dialog_box.dart';
import 'package:app_one_todo_with_hive/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the box
  final _mybox = Hive.box("mybox");

  // initialise the database
  ToDoDatabase database = ToDoDatabase();

  // declare the text controller her
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if this is the 1st time ever opening the app, then create default data
    if (_mybox.get("TOTOLIST") == null) {
      database.createInitiateData();
    } else {
      // there already exist data
      database.loadData();
    }
  }

  // create a new to do task
  void createNewTodoTask() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDiaglogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      database.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    database.updateDatabase();
  }

  // checkbox was tapped
  void checkBoxChange(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    database.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text(
          "My Personal Todo App",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: database.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: database.toDoList[index][0],
              taskComplete: database.toDoList[index][1],
              onChange: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTodoTask,
        child: Icon(
          Icons.add,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
}
