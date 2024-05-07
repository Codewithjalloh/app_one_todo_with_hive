import 'package:app_one_todo_with_hive/util/my_button.dart';
import 'package:flutter/material.dart';

class MyDiaglogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  MyDiaglogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // this is the user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new to do here..."),
            ),

            // save button and also cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 8,
                ),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
