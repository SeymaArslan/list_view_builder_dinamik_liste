import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  String ulkeAdi;
  DetaySayfa({required this.ulkeAdi}); // süslü parantez koyma sebebimiz bu sınıftan bir nesne oluştururken ulkeAdi. şeklinde verileri çekmek

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Center(
        child: Text(widget.ulkeAdi, style: TextStyle(fontSize: 30),), // widget ile state özelliği olan sınıfımızdaki değişkene erişebiliyoruz
      ),
    );
  }
}
