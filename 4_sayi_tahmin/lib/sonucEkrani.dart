import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  late bool sonuc;
  SonucEkrani({required this.sonuc});

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
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
            widget.sonuc
                ? Image.asset("resimler/mutluResim.png")
                : Image.asset("resimler/uzgunResim.png"),
            Text(
              widget.sonuc ? "Kazandınız" : "Kaybettiniz",
              style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TEKRAR OYNA"),
                onPressed: () {
                  Navigator.pop(context); //bACK tuşunun işini yapar
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
