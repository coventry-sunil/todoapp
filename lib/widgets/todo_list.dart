import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  TodoListBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  void onItemClicked({required int index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.todoList.removeAt(index);
                    });
                    widget.updateLocalData();
                    Navigator.pop(context);
                  },
                  child: Text('Mark as Done')),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          //return Text(listText[index]);
          return ListTile(
            onTap: () {
              onItemClicked(index: index);
            },
            title: Text(widget.todoList[index]),
            //trailing: Icon(Icons.access_alarm_rounded),
            //leading: Icon(Icons.arrow_back_ios),
          );
        });
  }
}
