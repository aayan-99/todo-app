import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_test_app/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onToDoDelete;

  const ToDoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onToDoDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.lightBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration:
                  todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: () {
              onToDoDelete(todo.id);
            },
            color: Colors.white,
            iconSize: 15,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  } 
}
