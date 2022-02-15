import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_pro/Widgets/models.dart';
import 'package:ui_pro/main.dart';
import 'package:ui_pro/Screens/calculate.dart';

List<String> cities = [
  'Ordu',
  'Giresun',
  'Carsamba',
  'Sakarya',
  'ersin',
  'Persembe',
  'Gölköy',
  'Anan',
  'Luna',
  'Safir'
];

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<List<GetItems>> getCities() async {
    QuerySnapshot snapshot = await db.collection('cities').get();
    List<GetItems> firebaseItemList =
        snapshot.docs.map((doc) => GetItems.createFdocument(doc)).toList();
    return firebaseItemList;
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.white,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            barHeight: MediaQuery.of(context).size.height / 10),
        selectedIndex: _selectedIndex,
        onSelectTab: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Anasayfa',
          ),
          FFNavigationBarItem(
            iconData: Icons.attach_money,
            label: 'Hesapla',
          ),
          FFNavigationBarItem(
            iconData: Icons.new_releases,
            label: 'Haberler',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
      body: IndexedStack(
          index: _selectedIndex, children: [buildBody(), Calculator()]),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
