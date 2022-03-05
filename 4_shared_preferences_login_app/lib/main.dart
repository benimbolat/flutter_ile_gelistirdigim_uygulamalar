import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/Anasayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> oturumKontrol() async {
    var sp = await SharedPreferences.getInstance();

    String spKullaniciAdi = sp.getString("kullaniciAdi") ?? "kullanici adi yok";
    String spSifre = sp.getString("sifre") ?? "sifre yok";

    if (spKullaniciAdi == "admin" && spSifre == "123") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: oturumKontrol(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool gecisIzni = snapshot.data!;
            return gecisIzni ? Anasayfa() : LoginEkrani();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class LoginEkrani extends StatefulWidget {
  @override
  State<LoginEkrani> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginEkrani> {
  var tfHullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> girisKontrol() async {
    var ka = tfHullaniciAdi.text;
    var s = tfSifre.text;
    if (ka == "admin" && s == "123") {
      var sp = await SharedPreferences.getInstance();

      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", s);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Anasayfa(),
        ),
      );
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Giriş Hatalı"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // bu şekilde arayüzü kontrol edeceğiz.
      appBar: AppBar(
        title: Text("Login Ekranı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller:
                    tfHullaniciAdi, //bu controller sayesinde bilgiyi okuyacagız.
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı",
                ),
              ),
              TextField(
                obscureText: true, // şifreyi gizler
                controller:
                    tfSifre, //bu controller sayesinde bilgiyi okuyacagız.
                decoration: InputDecoration(
                  hintText: "Şifre",
                ),
              ),
              ElevatedButton(
                child: Text("Giriş Yap"),
                onPressed: () {
                  girisKontrol();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
