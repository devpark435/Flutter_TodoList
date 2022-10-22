import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'todoListMain.dart';

class todoCalendar extends StatefulWidget {
  const todoCalendar({super.key});

  @override
  State<todoCalendar> createState() => _todoCalendar();
}

class _todoCalendar extends State<todoCalendar> {
  DateTime _focusedDay = DateTime.now();

  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo_List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (builder) => todoListMain())),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime(2022, 01, 01),
                lastDay: DateTime(2022, 12, 31),
                focusedDay: _focusedDay,
                locale: 'ko-KR',
                startingDayOfWeek: StartingDayOfWeek.sunday,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    _selectedDay = selectDay;
                    _focusedDay = focusDay;
                  });
                  print(_focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(_selectedDay, date);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
