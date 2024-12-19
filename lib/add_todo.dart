import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final void Function({required String todoText}) addTodo;
  const AddTodo({super.key, required this.addTodo});

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
          autofocus: true,
          controller: todoText,
        ),
        ElevatedButton(
            onPressed: () {
              if (todoText.text.isNotEmpty) {
                widget.addTodo(todoText: todoText.text);
              }
              todoText.text = "";
            },
            child: Text('Add'))
      ],
    );
  }
}
