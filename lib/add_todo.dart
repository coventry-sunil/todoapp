import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

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
            },
            child: Text('Add'))
      ],
    );
  }
}
