import 'package:flutter/material.dart';

Widget getAppTitleWidget() {
  return new Container(
      height: 80.0,
      margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/FilbertBanner.jpg'),
        fit: BoxFit.cover,
      )),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Fındık Borsası',
          style: new TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
        Container(child: Image.asset('assets/images/unnamed.png'), width: 55.0),
      ]));
}
