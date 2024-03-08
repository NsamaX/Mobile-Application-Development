import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'coffee_class.dart';
import 'coffee_info.dart';

void main() {
  runApp(const MyApp());
}

List<coffee> menu = [];
String currentType = 'hot';
Map<String, String> typeUrls = {
  'hot': 'https://api.sampleapis.com/coffee/hot',
  'iced': 'https://api.sampleapis.com/coffee/iced'
};

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getData(currentType);
  }

  Future<void> getData(String type) async {
    final url = typeUrls[type];
    try {
      http.Response response = await http.get(Uri.parse(url!));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<coffee> fetchedmenu = jsonData.map((item) {
          return coffee(
            title: item['title'],
            description: item['description'],
            ingredients: List<String>.from(item['ingredients']),
            image: item['image'],
            id: item['id'],
          );
        }).toList();
        setState(() {
          menu = fetchedmenu;
          print('menu loaded: ' + menu.length.toString() + ' items');
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return buildCard(context, menu[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, coffee item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeInfoPage(item: item),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF404040),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
