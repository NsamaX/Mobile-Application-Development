import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const Color colorHardPurple = Color.fromARGB(255, 43, 26, 74);
const Color colorPurple = Color.fromARGB(255, 111, 67, 192);
const Color colorLightPurple = Color.fromARGB(255, 211, 188, 255);
const Color colorLightBlack = Color.fromARGB(255, 53, 53, 53);
const Color colorLightGreen = Color.fromARGB(255, 178, 255, 89);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LED(),
    );
  }
}

class LED extends StatefulWidget {
  const LED({Key? key}) : super(key: key);

  @override
  _LEDState createState() => _LEDState();
}

class _LEDState extends State<LED> {
  int currentDigit = 0; // ติดตามตัวเลขปัจจุบัน

  List<List<bool>> ledMatrix =
      List.generate(7, (_) => List.filled(5, false)); // ข้อมูลของ LED Matrix

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPurple,
        title: Center(
          child: Text(
            "CP-SU LED MATRIX", // ชื่อแอป
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: Container(
        color: colorLightPurple, // Set background color here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button('up'), // ปุ่มเพิ่ม
              frame(), // แสดงตัวเลขบน LED Matrix
              button('down'), // ปุ่มลด
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String direction) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // จัดการการกดปุ่มตามทิศทาง
          if (direction == 'up') {
            // เพิ่มค่าตัวเลขปัจจุบัน
            setState(() {
              currentDigit < 99 ? currentDigit += 1 : currentDigit = 0;
            });
          } else if (direction == 'down') {
            // ลดค่าตัวเลขปัจจุบัน
            setState(() {
              currentDigit > 0 ? currentDigit -= 1 : currentDigit = 99;
            });
          }
          updateLEDMatrix(); // อัปเดต LED Matrix ตามตัวเลขปัจจุบัน
        },
        child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            direction == 'up' ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            size: 80.0,
            color: colorHardPurple,
          ),
        ),
      ),
    );
  }

  Widget frame() {
    String formattedDigit =
        currentDigit.toString().padLeft(2, '0'); // แปลงตัวเลขปัจจุบันเป็นสตริง

    // แยกหลักสิบและหลักหน่วย
    int firstDigit = int.parse(formattedDigit.substring(0, 1));
    int secondDigit = int.parse(formattedDigit.substring(1));

    return Container(
      width: 340.0,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 10.0),
        boxShadow: [
          BoxShadow(
            color: colorPurple.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            led(firstDigit), // แสดงหลักสิบ
            led(secondDigit), // แสดงหลักหน่วย
          ],
        ),
      ),
    );
  }

  // แสดง LED Matrix
  Widget led(int digit) {
    List<List<int>> ledConfig = dotsData[digit];

    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ledConfig.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row.map((dot) {
              return ledLight(dot == 1);
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  // อัปเดตจุด LED ตามสถานะปัจจุบัน
  Widget ledLight(bool state) {
    return Padding(
      padding: const EdgeInsets.all(1.2),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: state ? colorLightGreen : colorLightBlack,
        ),
      ),
    );
  }

  // อัปเดต LED Matrix ตามตัวเลขปัจจุบัน
  void updateLEDMatrix() {
    List<List<int>> newLEDConfig = dotsData[currentDigit];
    for (int i = 0; i < ledMatrix.length; i++) {
      for (int j = 0; j < ledMatrix[i].length; j++) {
        if (ledMatrix[i][j] != (newLEDConfig[i][j] == 1)) {
          setState(() {
            ledMatrix[i][j] = newLEDConfig[i][j] == 1;
          });
        }
      }
    }
  }
}

// 0 = จุดดับ (LED off), 1 = จุดสว่าง (LED on)
const dotsData = [
  // ตัวเลข 0
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // ตัวเลข 1
  [
    [0, 0, 1, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 1, 1, 0],
  ],
  // ตัวเลข 2
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0],
    [1, 1, 1, 1, 1],
  ],
  // ตัวเลข 3
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // ตัวเลข 4
  [
    [0, 0, 0, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 1, 0, 1, 0],
    [1, 0, 0, 1, 0],
    [1, 1, 1, 1, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0],
  ],
  // ตัวเลข 5
  [
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // ตัวเลข 6
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // ตัวเลข 7
  [
    [1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0],
  ],
  // ตัวเลข 8
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ],
  // ตัวเลข 9
  [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
  ]
];
