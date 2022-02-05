import 'package:bloc_ile_listeleme/KisiDetaySayfa.dart';
import 'package:bloc_ile_listeleme/KisiKayitSayfa.dart';
import 'package:bloc_ile_listeleme/KisilerCubit.dart';
import 'package:bloc_ile_listeleme/KisilerDurum.dart';
import 'package:bloc_ile_listeleme/KisilerdaoRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> KisilerCubit(KisilerdaoRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  AnaSayfa(),
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {


  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<KisilerCubit>().kisileriAlVeTetikle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: BlocBuilder<KisilerCubit,KisilerDurum>(
          builder: (context,kisilerDurum){

            if (kisilerDurum is KisilerYuklendi) {
               var kisiListesi = kisilerDurum.kisiListesi;
               
               return ListView.builder(
                   itemCount: kisiListesi.length,
                   itemBuilder: (context,indeks){
                     var kisi = kisiListesi[indeks];

                     return GestureDetector(
                       onTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetaySayfa(kisi: kisi)));
                       },
                       child: Card(
                         child: Row(
                            children: [
                                Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed:(){
                                      context.read<KisilerCubit>().kisileriSilVeTetikle(int.parse(kisi.kisi_id));

                                }, icon: Icon(Icons.delete, color: Colors.purple,)),
                              )

               ],
               ),
               ),
                     );

               },
               );

            }else{
              return Center();
            }
          }
      ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => KisiKayitSayfa()));

          },

          tooltip: "Kisi ekle",
          child: Icon(Icons.add),
        ),

    );
  }
}
