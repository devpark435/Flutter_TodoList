import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'todoListMain.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

var i = 0;

class todoCalendar extends StatefulWidget {
  const todoCalendar({super.key});

  @override
  State<todoCalendar> createState() => _todoCalendar();
}

class _todoCalendar extends State<todoCalendar> {
  DateTime _focusedDay = DateTime.now();

  DateTime _selectedDay = DateTime.now();
  // var _toDay = _focusedDay.day;

  // String dayString = _selectedDay.toString();
  // int selectDay = int.parse(_selectedDay.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo_List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => todoListMain(
                      day: _focusedDay,
                    ))),
      ),
      body: SingleChildScrollView(
        child: Column(
          // children: [
          //   SfCalendar(
          //     view: CalendarView.month,
          //     onSelectionChanged: (calendarSelectionDetails) =>
          //         isSameDay(_focusedDay, _selectedDay),
          //   )
          // ],
          children: [
            //TableCalendar
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
                  var day = _focusedDay.day;
                  print(day);
                  // todos.add(List<String>day=[] )
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(_selectedDay, date);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              // child: Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(5.0),
              //       shape: BoxShape.rectangle,
              //       boxShadow: [
              //         BoxShadow(
              //             blurRadius: 0,
              //             color: Color.fromARGB(255, 113, 113, 113),
              //             offset: Offset(0, 5))
              //       ]),
              // child: Column(
              //   children: [
              //     Text('당일 투두리스트 나올곳'),

              //     // for (var i;
              //     //     i <=
              //     //         todoArray?[int.parse(_focusedDay.day.toString())][i]
              //     //             .length;
              //     //     i++)
              //     //   Text(todoArray[int.parse(_focusedDay.day.toString())]
              //     //       [int.parse(i)])
              //   ],
              // ),
              child: SingleChildScrollView(
                child: Container(
                  height: 10000,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemCount: todoArray == null ? 0 : todoArray.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 80,
                          child: Card(
                              shadowColor: Colors.amber,
                              child: Center(
                                child: Text(todoArray[
                                        int.parse(_selectedDay.day.toString())]
                                    [index]),
                              )),
                        );
                      }),
                ),
              ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}

void dayWhile(int i) {
  int j = 0;
  do {
    Text(todoArray[i][j]);
    j++;
  } while (todoArray[i][j] == '');
}
