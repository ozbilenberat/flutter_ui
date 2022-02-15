import 'package:flutter/material.dart';

Container getListItemWidget() {
  return new Container(
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
    child: new Card(
        elevation: 5.0,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(
                    colors: [Colors.grey.shade100, Colors.grey.shade100],
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye_rounded,
                    size: 25.0,
                    color: Colors.green,
                  ),
                )
              ],
            ))),
  );
}
