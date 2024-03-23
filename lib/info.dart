import 'package:flutter/material.dart';
import 'api.dart';

class info extends StatelessWidget {
  final Anime anime;

  const info({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: ListView(
          children: [
            Center(child: Image.network(anime.posterImage)),
            SizedBox(height: 20),
            Text(
              'Title: ${anime.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Synopsis: ${anime.synopsis}'),
            SizedBox(height: 20),
            Text('Description: ${anime.description}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
