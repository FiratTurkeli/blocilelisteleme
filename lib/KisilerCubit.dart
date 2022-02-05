import 'package:bloc_ile_listeleme/KisilerdaoRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'KisilerDurum.dart';


class KisilerCubit extends Cubit<KisilerDurum>{

  KisilerRepository kisilerRepository;
  KisilerCubit(this.kisilerRepository):super(KisilerBaslangicSinifi());

  Future<void> kisileriAlVeTetikle() async {
    try{
      emit(KisilerYukleniyor());

      var kisiListeCevap = await kisilerRepository.kisileriGetir();
      emit(KisilerYuklendi(kisiListeCevap));

    }catch(e){
      emit(KisilerHata("Kisiler alınırken hata oluştu"));
    }
  }

  Future<void> kisileriSilVeTetikle(int kisi_id) async {
    try{
      emit(KisilerYukleniyor());

      await kisilerRepository.kisiSil(kisi_id);

      var kisiListeCevap = await kisilerRepository.kisileriGetir();
      emit(KisilerYuklendi(kisiListeCevap));

    }catch(e){
      emit(KisilerHata("Kisiler alınırken hata oluştu"));
    }
  }


  Future<void> kisiKayitVeTetikle(String kisi_ad, String kisi_tel) async {
    try{
      emit(KisilerYukleniyor());

      await kisilerRepository.kayit(kisi_ad, kisi_tel);

      var kisiListeCevap = await kisilerRepository.kisileriGetir();
      emit(KisilerYuklendi(kisiListeCevap));

    }catch(e){
      emit(KisilerHata("Kisiler alınırken hata oluştu"));
    }
  }


  Future<void> kisiGuncelleVeTetikle(int kisi_id, String kisi_ad, String kisi_tel) async {
    try{
      emit(KisilerYukleniyor());

      await kisilerRepository.guncelle(kisi_id, kisi_ad, kisi_tel);

      var kisiListeCevap = await kisilerRepository.kisileriGetir();
      emit(KisilerYuklendi(kisiListeCevap));

    }catch(e){
      emit(KisilerHata("Kisiler alınırken hata oluştu"));
    }
  }
}