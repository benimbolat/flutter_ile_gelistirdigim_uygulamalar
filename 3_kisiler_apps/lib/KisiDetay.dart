import 'package:flutter/material.dart';
import 'package:kisiler_apps/KisiKayit.dart';
import 'package:kisiler_apps/Kisiler.dart';

class KisiDetaySayfasi extends StatefulWidget {
  KisiDetaySayfasi({Key? key}) : super(key: key);
  @override
  State<KisiDetaySayfasi> createState() => _KisiDetaySayfasiState();
}

class _KisiDetaySayfasiState extends State<KisiDetaySayfasi> {
  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  //veri kümesi oluşturmak için gerekli olan veri kümesi.
  Future<List<Kisiler>> tumKisileriGoster() async {
    var kisilerListesi = <Kisiler>[];

    var k1 = Kisiler(1, "Mehmet", "05555555555");
    var k2 = Kisiler(2, "Ali", "05555555555");
    var k3 = Kisiler(3, "Yıldız", "05555555555");

    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);

    return kisilerListesi;
  }

  //veri silme methodu
  Future<void> sil(int kisi_id) async {
    print("$kisi_id silindi");
    //Arayüzü günceller
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? /*Eğere sonuc true ise bura çalışacak*/
            TextField(
                decoration:
                    InputDecoration(hintText: "Arama için birşeyler yaz..."),
                //arama sonucu vermesi için
                onChanged: (aramaSonucu) {
                  //Arama sonuc her harf geldiği zaman veya silindiği zaman sonucu aktaracak
                  print("Arama sonucu : $aramaSonucu");
                  
                },
              )
            : Text("Kişi Detay"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //Eğere arama iconuna basarsam seetstate ile arayüzü güncelleyecek.
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
        future: tumKisileriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kisilerListesi = snapshot.data;
            //bu listeyi listview içerisinde göstermek için.
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context, indeks) {
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KisiDetaySayfasi()),
                    );
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            kisi.kisi_ad,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            kisi.kisi_tel,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              sil(kisi.kisi_id);
                            },
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KisiKayitSayfasi()),
          );
        },
        tooltip: 'Kişi Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
