import 'package:flutter/material.dart';
import 'package:todoapp/add_todo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String text = "simple text";

  List<String> listText = ["apple", "banana", "orange"];

  void changeText({required String todoText}) {
    setState(() {
      //text = '$todoText';
    });
  }

  @override
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
              onTap: () {
                showModalBottomSheet(
                    //backgroundColor: const Color.fromARGB(255, 240, 240, 241),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 250,
                          child: AddTodo(changeText: changeText),
                        ),
                      );
                    });
              },
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
            ListView.builder(
                itemCount: listText.length,
                itemBuilder: (BuildContext context, int index) {
                  //return Text(listText[index]);
                  return ListTile(
                    onTap: () {},
                    title: Text(listText[index]),
                    trailing: Icon(Icons.access_alarm_rounded),
                    leading: Icon(Icons.arrow_back_ios),
                  );
                }));
  }
}
