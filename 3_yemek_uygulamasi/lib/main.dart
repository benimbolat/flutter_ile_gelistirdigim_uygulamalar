import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/yemekler.dart';

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
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler("Ayran", 2.50, 1, "ayran.png");
    var y2 = Yemekler("Köfte", 15.99, 2, "kofte.png");
    var y3 = Yemekler("Ayran", 2.50, 3, "ayran.png");
    var y4 = Yemekler("Köfte", 15.99, 4, "kofte.png");
    var y5 = Yemekler("Ayran", 2.50, 5, "ayran.png");
    var y6 = Yemekler("Köfte", 15.99, 6, "kofte.png");
    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);
    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var YemekListesi = snapshot.data;
              return ListView.builder(
                itemCount: YemekListesi!.lenght,
                itemBuilder: (context, indeks) {
                  var yemek = YemekListesi[indeks];
                  return Card(
                    child: Row(
                      children: [
                        Image.asset("resimler/${yemek.yemek_resim_adi}"),
                        Column(
                          children: [
                            Text(
                              yemek.yemek_adi,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "${yemek.yemek_fiyat} \u{20BA} ",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
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
