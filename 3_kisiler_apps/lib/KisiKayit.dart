import 'package:flutter/material.dart';

class KisiKayitSayfasi extends StatefulWidget {
  KisiKayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfasi> createState() => _KisiKayitSayfasiState();
}

class _KisiKayitSayfasiState extends State<KisiKayitSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Kayıt"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Kişi Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
