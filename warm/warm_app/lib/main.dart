import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Sayac(
          isim: 'Bardak',
        ));
  }
}

class Sayac extends StatefulWidget {
  final String isim;

// ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Sayac({required this.isim});

  @override
  _SayacState createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Text(widget.isim + 'sayisi: $sayi'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              sayi++;
             
            });
          },
        ));
  }
}
