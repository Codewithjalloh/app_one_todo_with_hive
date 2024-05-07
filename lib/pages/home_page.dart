import 'package:app_one_todo_with_hive/util/dialog_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // declare the text controller her
  TextEditingController controller = TextEditingController();

  // create a new to do task
  void createNewTodoTask() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDiaglogBox(
              controller: controller, onSave: () {}, onCancel: () {});
        });
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
