import 'package:flutter/material.dart';
import 'package:ui_pro/Widgets/AppTitleWidget.dart';
import 'package:ui_pro/Screens/Homepage.dart';
import 'package:ui_pro/Widgets/ListViewWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

final db = FirebaseFirestore.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Center(
      child: MyHomePage(),
    ),
  ));
}

Widget buildBody() {
  return new Container(
    margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
    child: new Column(
      children: <Widget>[
        getAppTitleWidget(),
        getListViewWidget(),
      ],
    ),
  );
}
