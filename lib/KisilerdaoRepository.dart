import 'package:bloc_ile_listeleme/KisilerCevap.dart';

import 'Kisiler.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class KisilerRepository{
  Future<List<Kisiler>> kisileriGetir();
  Future<void> kisiSil(int kisi_id);
  Future<void> kayit(String kisi_ad,String kisi_tel);
  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel);


  }

  class KisilerdaoRepository implements KisilerRepository{

  List<Kisiler> parseKisilerCevap(String cevap){
   return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;


  }
  @override
  Future<List<Kisiler>> kisileriGetir() async {
   var url =  Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
   var cevap = await http.get(url);

   return parseKisilerCevap(cevap.body);
  }

  Future<void> kisiSil(int kisi_id) async {
    var url =  Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString()};
    var cevap = await http.post(url, body: veri);
    print("Silme cevap : ${cevap.body}");
  }


  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    var url =  Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await http.post(url, body: veri);
    print("Ekle cevap : ${cevap.body}");
  }

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    var url =  Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString(),"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await http.post(url, body: veri);
    print("Guncelle cevap : ${cevap.body}");
  }


  }
