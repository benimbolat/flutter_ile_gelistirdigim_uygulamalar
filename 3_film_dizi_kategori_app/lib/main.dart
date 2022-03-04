import 'package:film_dizi_kategori_app/detaySayfa.dart';
import 'package:film_dizi_kategori_app/filmler.dart';
import 'package:flutter/material.dart';

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
  Future<List<Filmler>> filmleriGetir() async {
    var filmlerListesi = <Filmler>[];

    var f1 = Filmler("Aquamen", 15.99, 1, "aquaman.jpg");
    var f2 = Filmler("Dunkirk", 13.99, 2, "dunkirk.jpg");
    var f3 = Filmler("Eternals", 19.99, 3, "eternals.jpg");
    var f4 =
        Filmler("Fantastik Canavarlar", 15.99, 4, "fantastikcanavarlar.jpg");
    var f5 = Filmler("Harry Potter 2", 19.99, 5, "harrypotter.jpg");
    var f6 = Filmler("Penceremde", 13.99, 6, "penceremde.jpg");
    var f7 = Filmler("Red Notice", 15.99, 7, "rednotice.jpg");
    var f8 = Filmler("Woner Women", 15.99, 8, "wonderwoman.jpg");

    //Bu nesneleri Filmler nesnesine atamak için ->
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    filmlerListesi.add(f7);
    filmlerListesi.add(f8);

    // Bu methodu çalıştırdığım zaman bana listeyi döndürecek.
    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3.5,
              ),
              itemBuilder: (context, indeks) {
                var film = filmlerListesi[indeks];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfa(
                          film: film,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "resimler/${film.film_resim_adi}",
                          ),
                        ),
                        Text(
                          film.film_adi,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${film.film_fiyat} \u{20BA}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
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
    );
  }
}
