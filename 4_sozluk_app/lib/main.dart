import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sozluk_app/DetaySayfa.dart';
import 'package:sozluk_app/Kelimeler.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";
  //
  Future<List<Kelimeler>> tumKelimeleriGoster() async {
    var kelimelerListesi = <Kelimeler>[];
    var k1 = Kelimeler(1, "Dog", "Köpek");
    var k2 = Kelimeler(1, "Fish", "Balık");

    kelimelerListesi.add(k1);
    kelimelerListesi.add(k2);

    return kelimelerListesi;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: InputDecoration(
                    hintText: "Arama için birşeyler yazınız..."),
                onChanged: (aramaSonucu) {
                  print("Arama sonucu :  $aramaSonucu");
                  setState(() {
                    aramaKelimesi = aramaSonucu;
                  });
                },
              )
            : Text("Sözlük Uygulamasi"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                      aramaKelimesi = "";
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Kelimeler>>(
          future: tumKelimeleriGoster(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kelimelerListesi = snapshot.data;
              return ListView.builder(
                itemCount: kelimelerListesi!.length,
                itemBuilder: (context, indeks) {
                  var kelime = kelimelerListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetaySayfa(
                                    kelime: kelime,
                                  )));
                    },
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              kelime.ingilizce,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(kelime.turkce),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
