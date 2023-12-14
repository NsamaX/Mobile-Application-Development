import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab2',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Vijuksama Hongthongdaeng'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> images = [
    {
      'url': 'images/girl_with_a_pearl_earring.jpg',
      'description': 
      """
      Girl With A Pearl Earring 
      เขียนโดยศิลปินชาวดัตช์ชื่อโยฮัน เวอร์เมีย (Johannes Vermeer)
      """
      /*
      เป็นหนึ่งในผลงานที่เป็นเอกลักษณ์และมีความสำคัญในศิลปะโลก ซึ่งเป็นศิลปินที่มีผลงานน้อยแต่มีชื่อเสียงอย่างมากในวงการศิลปะ ภาพนี้เป็นหนึ่งในงานศิลปะที่น่าสนใจ เพราะไม่มีประวัติที่แน่ชัดเกี่ยวกับการสร้างและวันที่ที่แน่ชัด มีการสันนิษฐานว่าอาจเป็นผลงานที่รับจ้างเขียน 
      แต่ยังไม่มีข้อมูลที่ชัดเจนเกี่ยวกับผู้จ้างหรือวัตถุประสงค์ของการสร้างภาพนี้
      
      นวนิยายของ Tracy Chevalier ชื่อ "Girl With A Pearl Earring" ที่เขียนขึ้นในปี 1999 เป็นเหตุผลที่ทำให้ภาพนี้กลายเป็นที่รู้จักอย่างมากในสมัยปัจจุบัน นวนิยายดังกล่าวได้สร้างเรื่องราวของตัวละครและสถานการณ์ที่เป็นแรงบันดาลใจให้กับการสร้างภาพ Girl With A Pearl Earring โดย Tracy Chevalier กล่าวถึงเรื่องราวที่อาจเกิดขึ้นในการสร้างภาพนี้ นี่คือเหตุผลที่ทำให้มีความสนใจและความสำคัญมากในวงการศิลปะและวรรณกรรมสมัยปัจจุบัน
      """
      */
      ,
    },
    {
      'url': 'images/mona_lisa.jpg',
      'description': 
      """
      Mona Lisa 
      เขียนโดยศิลปินชาวอิตาลีชื่อเลโอนาร์โด ดาวินชี (Leonardo da Vinci)
      """
      /*
      เป็นหนึ่งในภาพเขียนที่มีชื่อเสียงและได้รับความสนใจมากที่สุดในโลก ในช่วงยุคฟื้นฟูศิลปวิทยาที่เมืองฟลอเรนซ์ของประเทศอิตาลี เริ่มต้นการสร้างภาพในปี 1503 หรือ 1504 และเสร็จสิ้นในไม่นานก่อนเสียชีวิตในปี 1519 

      และมีชื่อเต็มว่า "La Gioconda" ซึ่งแปลว่า "นางแบบแจ่มใส" และตั้งชื่อตาม Lisa del Giocondo ซึ่งเป็นภรรยาของชายที่มั่งคั่งแห่งฟลอเรนซ์ ในปี 1911 ถูกขโมยออกจากพิพิธภัณฑ์ลูฟร์โดโดย Vincenzo Peruggia ผู้รักชาติชาวอิตาลี ซึ่งเขาเชื่อว่าภาพนี้ควรจะอยู่ที่ประเทศอิตาลี

      หลังจากการเก็บภาพไว้ในอพาร์ตเมนต์ของเขาเป็นเวลาสองปี เปรุเจีย (Peruggia) ถูกจับได้เมื่อพยายามขายภาพให้กับองค์กรที่เรียกว่า "Uffizi Gallery" ในเมืองฟลอเรนซ์ โมนาลิซาถูกนำมาแสดงอีกครั้งที่พิพิธภัณฑ์ลูฟร์ในกรุงปารีส โดยมีผู้เข้าชมภาพนี้มากถึง 6 ล้านคนในแต่ละปี ซึ่งเป็นการยกย่องถึงความสำคัญและความสมบูรณ์ของภาพ "Mona Lisa" ที่ยังคงโดดเด่นและได้รับความสนใจจากผู้ชมมาโดยตลอดเวลา
      """
      */
      ,
    },
    {
      'url': 'images/the_creation_of_adam.jpg',
      'description': 
      """
      The Creation of Adam 
      เขียนโดยศิลปินชื่อไมเคิลแองเจโล (Michelangelo)
      """
      /*
      เป็นผลงานที่มีชื่อเสียงและเป็นหนึ่งในภาพเขียนที่สำคัญที่สุดในโลกศิลปะ บนเพดานศิลปะของโบสถ์น้อยซิสติน (Sistine Chapel) ภายในสำมะโนปาปาในกรุงวาติกัน ภาพถูกสร้างขึ้นระหว่างปี 1508 ถึง 1512 
      
      เพดานของโบสถ์น้อยซิสตินถูกตกแต่งด้วยภาพเขียนที่เล่าเรื่องเหตุการณ์จากพระคัมภีร์ปฐมกาล 9 และภาพ "The Creation of Adam" เป็นภาพที่อยู่ตรงกลางเพดาน ภาพนี้ถือเป็นหนึ่งในภาพเขียนที่มีชื่อเสียงที่สุดตลอดกาลในวงการศิลปะ และเป็นภาพที่ได้รับความนิยมและถูกล้อเลียนมากมายจนไม่สามารถนับได้
      """
      */
      ,
    },
  ];

  late Random random;

  @override
  void initState() {
    super.initState();
    random = Random();
  }

  Map<String, String> getRandomImage() {
    final int randomNumber = random.nextInt(images.length);
    return images[randomNumber];
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> randomImage = getRandomImage();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 400, // กำหนดความกว้าง
                height: 400, // กำหนดความสูง
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(randomImage['url']!),
                    fit: BoxFit.cover, // ทำให้รูปภาพที่อยู่ภายใน container ปรับขนาดให้พอดีกับ container
                  ),
                  borderRadius: BorderRadius.circular(12), // กำหนดขอบเขตของรูปให้เป็นสี่เหลี่ยมจัตุรัด
                ),
              ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                randomImage['description']!,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}