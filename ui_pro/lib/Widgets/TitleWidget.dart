import 'package:flutter/material.dart';

Text getTitleWidget(String districtName) {
  return new Text(
    districtName,
    style: new TextStyle(fontWeight: FontWeight.bold),
  );
}
