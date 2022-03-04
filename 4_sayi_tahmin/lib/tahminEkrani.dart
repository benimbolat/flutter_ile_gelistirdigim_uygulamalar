import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin/sonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin = TextEditingController(); //Texfield üzerinden veri alacak
  int ratgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    ratgeleSayi =
        Random().nextInt(101); //0 ile 100 arasında sayı uretip değişkene işler
    print("Rastgele Sayı : $ratgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(color: Colors.pink, fontSize: 30),
            ),
            Text(
              "Yardım : $yonlendirme",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin, // girilen bilgi buraya iletilir.
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tahmin Et!"),
                onPressed: () {
                  setState(() {
                    kalanHak = kalanHak - 1;
                  });
                  int tahmin = int.parse(tfTahmin.text);

                  if (tahmin == ratgeleSayi) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  sonuc: true,
                                )));
                    return; //butonun çalışmasını tam burada durduracak.
                  }
                  if (tahmin > ratgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }
                  if (tahmin < ratgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(
                                  sonuc: false,
                                )));
                  }
                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
