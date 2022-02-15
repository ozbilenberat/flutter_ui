import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GetItems {
  final String city;
  final num price;
  final Timestamp dtime;
  GetItems({@required this.city, this.price, this.dtime});

  factory GetItems.createFdocument(DocumentSnapshot doc) {
    return GetItems(price: doc['price'], city: doc['city'], dtime: doc['date']);
  }
}
