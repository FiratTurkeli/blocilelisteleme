import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Kisiler.dart';
import 'KisilerCubit.dart';

class KisiDetaySayfa extends StatefulWidget {
  late Kisiler kisi;


  KisiDetaySayfa({required this.kisi});

  @override
  _KisiDetaySayfaState createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_tel;
  }

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
          BlocProvider.of<KisilerCubit>(context).kisiGuncelleVeTetikle(int.parse(widget.kisi.kisi_id),  tfKisiAdi.text, tfKisiTel.text);


        },

        tooltip: "Kisi kaydet",
        icon: Icon(Icons.save_outlined),
        label:Text("Guncelle") ,
      ),

    );
  }
}
