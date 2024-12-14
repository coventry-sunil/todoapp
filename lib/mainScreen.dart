import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                      return Container(
                        height: 250,
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ));
  }
}
