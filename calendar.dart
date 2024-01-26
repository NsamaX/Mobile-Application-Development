import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

final int year = 2024;

final List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

final List<String> thai_months = [
  "มกราคม",
  "กุมภาพันธ์",
  "มีนาคม",
  "เมษายน",
  "พฤษภาคม",
  "มิถุนายน",
  "กรกฎาคม",
  "สิงหาคม",
  "กันยายน",
  "ตุลาคม",
  "พฤศจิกายน",
  "ธันวาคม"
];

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 80, 0, 200),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Container(
                child: Text(
                  "CALENDAR ${year}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Column(
                  children:
                      List.generate((months.length / 3).ceil(), (rowIndex) {
                    return Row(
                      children: List.generate(3, (colIndex) {
                        final index = rowIndex * 3 + colIndex;
                        if (index < months.length) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMonthIndex = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: index == selectedMonthIndex
                                        ? Colors.blue
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  height: 26,
                                  child: Center(
                                    child: Text(
                                      months[index],
                                      style: TextStyle(
                                        color: index == selectedMonthIndex
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 0, 60, 120),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    );
                  }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "${thai_months[selectedMonthIndex]}\n${year + 543}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "${months[selectedMonthIndex]}\n${year}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                  horizontal: BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: _buildWeekdayLabels(),
                                ),
                              ),
                            ),
                            _buildCalendar(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWeekdayLabels() {
    return [
      Text("S",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      Text("M", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("T", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("W", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Th", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("F", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("S", style: TextStyle(fontWeight: FontWeight.bold)),
    ];
  }

  Widget _buildCalendar() {
    DateTime firstDayOfMonth = DateTime(year, selectedMonthIndex + 1, 2);
    int daysInMonth = DateTime(year, selectedMonthIndex + 1, 0).day;
    int firstDayOfWeek = firstDayOfMonth.weekday;
    if (firstDayOfWeek == 7) {
      firstDayOfWeek = 1;
    }

    List<Widget> calendarRows = [];

    for (int i = 0; i < 6; i++) {
      List<Widget> rowChildren = [];

      for (int j = 0; j < 7; j++) {
        int dayNumber = i * 7 + j + 1 - firstDayOfWeek;
        bool isCurrentMonth = dayNumber > 0 && dayNumber <= daysInMonth;

        rowChildren.add(
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  isCurrentMonth ? "$dayNumber" : "",
                  style: TextStyle(
                    color: isCurrentMonth ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      calendarRows.add(Row(
        children: rowChildren,
      ));
    }

    return Column(
      children: calendarRows,
    );
  }
}
