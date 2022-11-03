import 'package:flutter/material.dart';
import 'package:flutter_todo_application/main.dart';
import 'package:table_calendar/table_calendar.dart';
import '/main.dart';

String input = "";
/**String Input */

List<String> todos = [];

class todoListMain extends StatefulWidget {
  const todoListMain({super.key, required this.day});
  final DateTime day;

  @override
  State<todoListMain> createState() => _todoListMain();
}

class _todoListMain extends State<todoListMain> {
  late String theDay = widget.day.toString();
  late String theOnlyDay = theDay.replaceAll(" 00:00:00.000Z", "");
  late List<String> toDayList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theOnlyDay),
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
                              toDayList.add(input);
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
          itemCount: toDayList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${toDayList[index]}"),
                    IconButton(
                      icon: (Icon(Icons.delete,
                          color: Color.fromARGB(244, 250, 98, 68))),
                      onPressed: () {
                        setState(() {
                          todos.add(input);
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
