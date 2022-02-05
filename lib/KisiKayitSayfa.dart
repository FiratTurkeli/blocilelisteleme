
import 'package:bloc_ile_listeleme/KisilerCubit.dart';
import 'package:bloc_ile_listeleme/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  _KisiKayitSayfaState createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kisi Kayıt"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50.0 , right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tfKisiAdi,
              decoration: InputDecoration(
                hintText: "Kişi adı giriniz"
              ),
            ),
            TextField(
              controller: tfKisiTel,
              decoration: InputDecoration(
                  hintText: "Kişi telefonu giriniz"
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          BlocProvider.of<KisilerCubit>(context).kisiKayitVeTetikle(tfKisiAdi.text, tfKisiTel.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfa()));

        },

        tooltip: "Kisi kaydet",
        icon: Icon(Icons.save_outlined),
        label:Text("Kaydet") ,
      ),

    );
  }
}
