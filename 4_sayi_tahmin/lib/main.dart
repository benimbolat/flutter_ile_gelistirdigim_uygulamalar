import 'package:flutter/material.dart';
import 'package:sayi_tahmin/tahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(title: ''),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Tahmin Oyunu",
              style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            Image.asset("resimler/zar.png"),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("OYNA BAŞLA"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
