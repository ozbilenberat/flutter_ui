import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelViewer extends StatelessWidget {
  final String city;
  final num price;

  ModelViewer({this.city, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade300,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200.withOpacity(1),
                  spreadRadius: 2.0,
                  blurRadius: 3.0,
                  offset: Offset(0, 1))
            ]),
        margin: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(child: Text('sehir')),
            Container(
              child: Text('price'),
            )
          ],
        ));
  }
}
