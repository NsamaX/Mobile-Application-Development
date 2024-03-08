import 'package:flutter/material.dart';
import 'coffee_class.dart';

class CoffeeInfoPage extends StatelessWidget {
  final coffee item;

  const CoffeeInfoPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
                height: 400.0,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 20.0),
            Text(item.title,
                style: TextStyle(color: Colors.white, fontSize: 30)),
            Text('description',
                style: TextStyle(color: Colors.white.withOpacity(0.8))),
            Text('     ' + item.description,
                style: TextStyle(color: Colors.white.withOpacity(0.4))),
          ],
        ),
      ),
    );
  }
}
