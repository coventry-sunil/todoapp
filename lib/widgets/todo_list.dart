import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  final List<String> todoList;
  final void Function() updateLocalData;
  const TodoListBuilder(
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
              width: double.infinity,
              height: 150,
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
    return (widget.todoList.isEmpty)
        ? Center(child: Text("No items for the Todo List"))
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              //return Text(listText[index]);
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                // secondaryBackground: Container(color: Colors.red[300]),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Icon(Icons.delete),
                //     ),
                //   ],
                // ),
                background: Container(
                  color: Colors.green[300],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                child: ListTile(
                  onTap: () {
                    onItemClicked(index: index);
                  },
                  title: Text(widget.todoList[index]),
                  //trailing: Icon(Icons.access_alarm_rounded),
                  //leading: Icon(Icons.arrow_back_ios),
                ),
              );
            });
  }
}
