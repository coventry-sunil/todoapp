import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Add Todo:'),
        TextField(
          controller: todoText,
        ),
        ElevatedButton(
            onPressed: () {
              print(todoText);
              widget.addTodo(todoText: todoText.text);
              todoText.text = "";
            },
            child: Text('Add'))
      ],
    );
  }
}
