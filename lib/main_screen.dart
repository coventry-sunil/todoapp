import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/add_todo.dart';
import 'package:todoapp/widgets/todo_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //String text = "simple text";

  List<String> todoList = [];
  List<String>? savedList;

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Already Exits!"),
              content: Text("This todo data already exists!"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                )
              ],
            );
          });
      return;
    }
    setState(() {
      //text = '$todoText';
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  void updateLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList("todoList") ?? []).toList();
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void showAddTodoBottomSheet() {
    showModalBottomSheet(
        //backgroundColor: const Color.fromARGB(255, 240, 240, 241),
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 250,
              child: AddTodo(addTodo: addTodo),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Text("Drawer Data"),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Todo App"),
          actions: [
            InkWell(
              onTap: showAddTodoBottomSheet,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
        body:
            // Container(
            //   child: Text('$text'),
            // ),
            TodoListBuilder(
                todoList: todoList, updateLocalData: updateLocalData));
  }
}
