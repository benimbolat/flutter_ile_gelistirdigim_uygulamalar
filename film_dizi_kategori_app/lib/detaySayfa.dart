import 'package:film_dizi_kategori_app/filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film;
  DetaySayfa({required this.film});
  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.film.film_adi), // üst sınıfa erişmek için widget kullanılır.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text(
              "${widget.film.film_fiyat} \u{20BA}",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("KİRALA"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  print("${widget.film.film_adi} kiralandı.");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
