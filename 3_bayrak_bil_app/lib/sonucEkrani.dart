import 'package:bayrak_bil_app/main.dart';
import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  int dogruSayisi;

  SonucEkrani({required this.dogruSayisi});
  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${widget.dogruSayisi} doğru - ${5 - widget.dogruSayisi} yanlış",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "% ${((widget.dogruSayisi * 100) / 5).toInt()} Başarı ile",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Dene"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
