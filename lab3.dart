import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PinLoginPage(),
    );
  }
}

class PinLoginPage extends StatefulWidget {
  const PinLoginPage({Key? key}) : super(key: key);

  @override
  _PinLoginPageState createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  String pin = '';

  void _addPinNumber(String number) {
    setState(() {
      pin += number;
    });
  }

  void _resetPinNumber() {
    setState(() {
      pin = '';
    });
  }

  void _removeLastNumber() {
    setState(() {
      if (pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.shield_sharp,
                  size: 65.0,
                ),
                Text(
                  "PIN LOGIN",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pin.padRight(6, '_'),
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton("1", "one"),
                    _buildNumberButton("2", "two"),
                    _buildNumberButton("3", "three"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton("4", "four"),
                    _buildNumberButton("5", "five"),
                    _buildNumberButton("6", "six"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton("7", "seven"),
                    _buildNumberButton("8", "eight"),
                    _buildNumberButton("9", "nine"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCancelButton(),
                    _buildNumberButton("0", "zero"),
                    _buildDeleteButton(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _addPinNumber(number),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey),
          ),
          width: 60.0,
          height: 60.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: _resetPinNumber,
        child: Container(
          width: 60.0,
          height: 60.0,
          child: Icon(Icons.close),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: _removeLastNumber,
        child: Container(
          width: 60.0,
          height: 60.0,
          child: Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }
}
