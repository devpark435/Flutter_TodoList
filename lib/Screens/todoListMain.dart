import 'package:flutter/material.dart';
import 'package:flutter_todo_application/main.dart';
import 'package:table_calendar/table_calendar.dart';

class todoListMain extends StatefulWidget {
  const todoListMain({super.key, required this.day});

  final DateTime day;

  @override
  State<todoListMain> createState() => _todoListMain();
}

class _todoListMain extends State<todoListMain> {
  String input = "";
  List<String> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo_List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Add Todolist"),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            setState(() {
                              todos.add(input);
                            });
                            Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                          },
                          child: Text("Add"))
                    ]);
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${todos[index]}"),
                  IconButton(
                    icon: (Icon(Icons.delete,
                        color: Color.fromARGB(244, 255, 55, 15))),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
