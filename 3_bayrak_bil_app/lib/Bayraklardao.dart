import 'package:bayrak_bil_app/VeritabaniYardimcisi.dart';
import 'package:bayrak_bil_app/bayraklar.dart';

class Bayraklardao {
  Future<List<Bayraklar>> rastgele5Getir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM bayraklar OREDER BY RANDOM() LIMIT 5");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bayraklar(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

  Future<List<Bayraklar>> rastgele3YanlisGetir(int bayrak_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id OREDER BY RANDOM() LIMIT 3");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bayraklar(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }
}
