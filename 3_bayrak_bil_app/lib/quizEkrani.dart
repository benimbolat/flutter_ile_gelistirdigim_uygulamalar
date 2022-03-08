import 'dart:collection';

import 'package:bayrak_bil_app/BayraklarDao.dart';
import 'package:bayrak_bil_app/bayraklar.dart';
import 'package:bayrak_bil_app/sonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;
  String bayrakResmiAdi = "placeholder.png";
  String ButtonAYazi = "";
  String ButtonBYazi = "";
  String ButtonCYazi = "";
  String ButtonDYazi = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Bayraklardao().rastgele5Getir();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];
    bayrakResmiAdi = dogruSoru.bayrak_resim;
    yanlisSecenekler =
        await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id);
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    ButtonAYazi = tumSecenekler.elementAt(0).bayrak_ad;
    ButtonBYazi = tumSecenekler.elementAt(1).bayrak_ad;
    ButtonCYazi = tumSecenekler.elementAt(2).bayrak_ad;
    ButtonDYazi = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {});
  }

  void soruSayacKontrol() {
    soruSayac = soruSayac + 1;
    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SonucEkrani(dogruSayisi: dogruSayac),
          ));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if (dogruSoru.bayrak_ad == buttonYazi) {
      dogruSayac = dogruSayac + 1;
    } else {
      yanlisSayac = yanlisSayac + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Doğru = $dogruSayac",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Yanlış = $yanlisSayac",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            soruSayac != 5
                ? Text(
                    "${soruSayac + 1}.Soru",
                    style: TextStyle(fontSize: 30),
                  )
                : Text(
                    "5.Soru",
                    style: TextStyle(fontSize: 30),
                  ),
            Image.asset("resimler/$bayrakResmiAdi"),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(ButtonAYazi),
                onPressed: () {
                  dogruKontrol(ButtonAYazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(ButtonBYazi),
                onPressed: () {
                  dogruKontrol(ButtonBYazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(ButtonCYazi),
                onPressed: () {
                  dogruKontrol(ButtonCYazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text(ButtonDYazi),
                onPressed: () {
                  dogruKontrol(ButtonDYazi);
                  soruSayacKontrol();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
