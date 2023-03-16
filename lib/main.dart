import 'package:flutter/material.dart';
import 'package:list_view_builder_dinamik_liste/DetaySayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // veri kümesindeki elemanların sayısı kadar arayüzde otomatik olarak satırların oluşmasıdır
  // tek tasarım yapacağız ve veri kümesindeki elemanlar kadar tasarımı çoğaltacağız, listview a veri kümesini vererek

  // veri kümemiz
  var ulkeler = ["Türkiye","Almanya","Hollanda","İtalya","İngiltere"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinamik ListView"),
      ),
      body: SizedBox( // yatayda kaydırma için kullandık. yatayda hareket ettireceğimiz için list in yüksekliğini daraltmamız
        // gerekiyor ki alt alan tasarım için kullanılabilir olsun bu yüzden list e bir yükseklik belirteceğiz alanın bu kadar bununla sınırlı olsun diye
        height: 100,  //yatayda kaydırma
        child: ListView.builder(
          scrollDirection: Axis.horizontal,  //yatayda kaydırma yatayda ekseni belirledik
          itemCount: ulkeler.length,
          itemBuilder: (context, indeks){
            // hem satır tasarımı oluşturmak hem veri kümesindeki elemanlar kadar bu satırı
            // tekrarlamamız için gerekli, parametre olarak context veriyor, indeks istersek farklı adlandırma da yapabiliriz
            // itemBuilder kaç tane eleman varsa o kadar çalışacak ve bize sırayla indeks numarasını verecek 0,1,2..  ve biz bu indeks
            // sayesinde arayüzde dinamik olarak verilerimizi göstereceğiz, satır tasarımını ve bu tasarımı çoğaltmayı burada yapacağız
            // itembuilder sanki bir döngü gibi itemcount tan aldığı veri sayısına göre çalışır

            return GestureDetector(
              onTap: (){
                //sayfa geçişi
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(ulkeAdi: ulkeler[indeks])));
                //print("${ulkeler[indeks]} seçildi."); // satıra tıklanıldığında işliyor
              },
              child: Card(  // tekrar eden yer burası yani card
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100, // yatayda scroll etme işleminde kullanıyoruz bu yüzden genişlik belirtiyoruz, yatayda sonsuzluk gibi bir hata almamak için genişliği sınırlıyoruz
                    //height: 45, // yukarıdan aşağıya doğru tanımlarken yükseklik kullandık
                    child: Row( // burası tasarımla ilgili yani satır içerisindeki tasarımı temsil ediyor
                      children: [
                        GestureDetector(
                            onTap: (){
                              print("Text ile tıklanarak ${ulkeler[indeks]} seçildi."); //text e tıklanıldığında işliyor
                            },
                            child: Text(ulkeler[indeks])
                        ),
                        Spacer(), // en sağa hizalamak için

                        /* TextButton(    ----------------------- ilk hali ----------------***--------------
                            onPressed: (){
                              print("Buton ile tıklanarak ${ulkeler[indeks]} seçildi.");
                            },
                            child: Text("Ülke Seç", style: TextStyle(color: Colors.red),),
                        ),  */

                        PopupMenuButton(
                          child: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 1, child: Text("Sil"),),
                            PopupMenuItem(value: 2, child: Text("Güncelle"),),
                          ],
                          onSelected: (menuItemValue){ // tıklanılan itemın value sunu getirecek özellik
                            if(menuItemValue == 1){
                              print("${ulkeler[indeks]} silindi.");
                            }
                            if(menuItemValue == 2){
                              print("${ulkeler[indeks]} güncellendi.");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
