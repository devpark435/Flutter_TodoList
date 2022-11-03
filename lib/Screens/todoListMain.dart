import 'package:flutter/material.dart';
import 'package:flutter_todo_application/main.dart';
import 'package:table_calendar/table_calendar.dart';
import '/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String> todos = [];

class todoListMain extends StatefulWidget {
  const todoListMain({super.key, required this.day});
  final DateTime day;

  @override
  State<todoListMain> createState() => _todoListMain();
}

class _todoListMain extends State<todoListMain> {
  late String theDay = widget.day.toString().substring(0, 10);
  late String toDay = theDay.substring(8, 10);
  String input = "";
  /**String Input */
  // late String toDay = theDay
  // late List<String> toDay = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(theDay)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Add Todolist at ${toDay}"),
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
                              if (input != '') {
                                todos.add(input);
                                input = '';
                              } else {
                                showToast('Event Null');
                              }
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
            return Card(
              // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${todos[index]}"),
                    IconButton(
                      icon: (Icon(Icons.delete,
                          color: Color.fromARGB(244, 250, 98, 68))),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Color.fromARGB(255, 109, 106, 251),
      textColor: Color.fromARGB(255, 0, 0, 0),
      fontSize: 5.0);
}
