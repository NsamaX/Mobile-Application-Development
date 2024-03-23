import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';
import 'info.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<Anime>>
      futureAnime; // ตัวแปรเก็บ Future ของ List<Anime> สำหรับการโหลดข้อมูล Anime

  // เมธอดสำหรับเรียก API และโหลดข้อมูล Anime จาก Kitsu
  Future<List<Anime>> fetchAnime() async {
    // เรียก API ด้วย http.get และแปลงข้อมูล JSON ที่ได้รับมา
    final response =
        await http.get(Uri.parse('https://kitsu.io/api/edge/anime'));

    if (response.statusCode == 200) {
      // ถ้าสำเร็จ (status code 200) จะแปลงข้อมูล JSON เป็น List<Anime> แล้วคืนค่ากลับ
      List<dynamic> data = jsonDecode(response.body)['data'];
      List<Anime> animeList = data.map((json) => Anime.fromJson(json)).toList();
      return animeList;
    } else {
      // ถ้าไม่สำเร็จ จะ throw Exception เพื่อแจ้งว่าโหลดข้อมูล Anime ไม่สำเร็จ
      throw Exception('Failed to load anime');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAnime = fetchAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text('Anime List')),
      ),
      body: Center(
        child: FutureBuilder<List<Anime>>(
          future: futureAnime,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // แสดง Indicator ในระหว่างโหลดข้อมูล
            } else if (snapshot.hasData) {
              // แสดงรายการ Anime เมื่อโหลดเสร็จสมบูรณ์
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Anime anime = snapshot.data![index];
                  return ListTile(
                    title: Text(anime.title),
                    // subtitle: Text(anime.synopsis),
                    leading: GestureDetector(
                      child: Image.network(anime.posterImage),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => info(anime: anime),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              // แสดงข้อผิดพลาดถ้าเกิดข้อผิดพลาดในการโหลดข้อมูล
              return Text('${snapshot.error}');
            }

            return Container(); // แสดง Container เปล่าๆ ในกรณีที่ไม่มีข้อมูลหรือข้อมูลว่าง
          },
        ),
      ),
    );
  }
}
