import 'package:flutter/material.dart';
import 'package:flutter_e_ticaret_uygulamasi/Categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double ekranBoyutu = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              //SafeArea Uygulamanın taşmasını engeller
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    //Başlık
                    baslik(),
                    //Banner
                    banner(),

                    //Row kutucuklar
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          yuvarlakButonlar("Kategori", Icons.menu,
                              CategoriesPage(), context),
                          yuvarlakButonlar("Sepetiniz", Icons.shopping_basket,
                              CategoriesPage(), context),
                          yuvarlakButonlar("Hediyeler", Icons.card_giftcard,
                              CategoriesPage(), context),
                              
                          yuvarlakButonlar(
                              "Daha Fazla",
                              Icons.more_vert_outlined,
                              CategoriesPage(),
                              context),
                        ],
                      ),
                    ),

                    //Alt Başlık Sales
                    const SizedBox(
                      height: 20,
                    ),

                    const Center(
                      child: Text(
                        "Ürünler",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0A1034)),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    //ürünler
                    Column(
                      children: [
                        Row(
                          children: [
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                            const SizedBox(width: 8),
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                          ],
                        ),
                        Row(
                          children: [
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                            const SizedBox(width: 8),
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                          ],
                        ),
                        Row(
                          children: [
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                            const SizedBox(width: 8),
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                          ],
                        ),
                        Row(
                          children: [
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                            const SizedBox(width: 8),
                            urunler("Samsung Telefon", "images/smartphone.png",
                                "50", ekranBoyutu),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //NavBar
            //! Stack sayesinde en üstte kalacak.
            Align(
              alignment: Alignment.bottomCenter, //alta hizalar
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, -3),
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10),
                  ],
                  color: const Color(0xFFEFF5FB),
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, //Aralarında boşluk
                  children: [
                    NavBarSimge(Icons.home_filled, true),
                    NavBarSimge(Icons.search, false),
                    NavBarSimge(Icons.shopping_basket, false),
                    NavBarSimge(Icons.person, false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget NavBarSimge(IconData iconData, bool active) {
  return Icon(
    iconData,
    size: 20,
    color: Color(active ? 0xFF0001FC : 0xFF0A1034),
  );
}

Widget baslik() {
  return const Padding(
    padding: EdgeInsets.only(top: 20),
    child: Text(
      "Home",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Color(0xFF0A1034),
      ),
    ),
  );
}

Widget banner() {
  return Padding(
    padding: const EdgeInsets.only(top: 24),
    child: SizedBox(
      width: 350,
      height: 100,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0001FC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 36, top: 25, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Taşınabilir Hapörlör",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "1500 TL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Image.asset("images/speaker-min.png"),
          ],
        ),
      ),
    ),
  );
}

Widget yuvarlakButonlar(String yuvarlakButonAdi, IconData yuvarlakButonIcon,
    Widget gidilecekYer, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CategoriesPage();
          },
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
                child: Icon(
                  yuvarlakButonIcon,
                  color: const Color(0xFF0001FC),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                yuvarlakButonAdi,
                style: const TextStyle(
                    color: Color(0xFF1F53E4),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget urunler(
  String urunAdi,
  String resimYolu,
  String indirimMiktari,
  double screenWidth,
) {
  return Container(
    width: (screenWidth - 40) * 0.5,
    padding: const EdgeInsets.only(left: 1, bottom: 14, right: 1),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: const Color(0xFFE0ECF8),
          ),
          child: Text(
            "% $indirimMiktari",
            style: const TextStyle(color: Color(0xFF1F53E4), fontSize: 12),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Image.asset(resimYolu),
        ),
        const SizedBox(
          height: 22,
        ),
        Center(
          child: Text(
            urunAdi,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF0A1034),
            ),
          ),
        ),
      ],
    ),
  );
}
