import 'package:flutter/material.dart';
import 'api_caller.dart';
import 'my_list_tile.dart';
import 'my_text_field.dart';
import 'dialog_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webby Fondue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Webby Fondue'),
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
  late TextEditingController _urlController;
  late TextEditingController _detailsController;
  late List<bool> _isCheckedList; // เพิ่มตัวแปรนี้

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
    _detailsController = TextEditingController();
    _isCheckedList =
        List.filled(4, false); // กำหนดค่าเริ่มต้นสำหรับรายการ checkbox
  }

  void _submitData() {
    // ดำเนินการเมื่อปุ่มส่งข้อมูลถูกกด
    String url = _urlController.text;
    String details = _detailsController.text;

    // ตรวจสอบว่าต้องกรอกข้อมูลหรือไม่
    if (url.isEmpty || details.isEmpty) {
      // แสดงข้อความแจ้งเตือนถ้าข้อมูลไม่ครบ
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('ต้องกรอก URL และเลือกประเภทเว็บ'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ตกลง'),
            ),
          ],
        ),
      );
      return; // ออกจากฟังก์ชันเพื่อไม่ดำเนินการต่อ
    }

    // ดำเนินการเพิ่มข้อมูลเข้ารายการหรือฐานข้อมูล
    // ตามที่คุณต้องการ

    // เคลียร์ข้อมูลใน TextField หลังจากส่งข้อมูลเสร็จสิ้น
    _urlController.clear();
    _detailsController.clear();

    // แสดงข้อความแจ้งเตือนว่าข้อมูลถูกส่งเรียบร้อย
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succes'),
        content: Text('ขอบคุณสำหรับการแจ้งข้อมูล รหัสข้อมูลของคุณคือ'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'ระบบรายงานเว็บเลวๆ',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '* ต้องกรอกข้อมูล',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  labelText: 'URL',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _detailsController,
                decoration: InputDecoration(
                  labelText: 'รายละเอียด',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ระบุประเภทเว็บเลว *',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // เพิ่มโค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                    },
                    icon: Image.asset('assates/fake_news_2.jpg'),
                    label: Text('เว็บพนัน'),
                    
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // เพิ่มโค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                    },
                    child: Text('เว็บปลอมแปลง เลียนแบบ'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // เพิ่มโค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                    },
                    child: Text('เว็บข่าวมั่ว'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // เพิ่มโค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                    },
                    child: Text('เว็บแชร์ลูกโซ่'),
                  ),
                ],
              ),
            ),
            /* Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  _submitData();
                },
                child: Text('ส่งข้อมูล'),
              ),
            ), */
            
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                _submitData();
              },
              child: Text('ส่งข้อมูล'),
            ),
          ),
        ],
      ),
    );
  }
}
