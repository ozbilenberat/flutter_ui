import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_pro/Widgets/models.dart';

Widget getListViewWidget() {
  return new Flexible(
      child: new StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("cities").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            List<GetItems> firebaseItemList = snapshot.data.docs
                .map((doc) => GetItems.createFdocument(doc))
                .toList();

            return ListView.builder(
                shrinkWrap: true,
                itemCount: firebaseItemList.length,
                itemBuilder: (context, index) {
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
                      child: new Card(
                          elevation: 5.0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.shade100,
                                      Colors.grey.shade100
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.bottomRight)),
                            child: Container(
                                margin: EdgeInsets.all(1.0),
                                height: 75.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                4.0, 1.0, 5.0, 5.0),
                                            height: 26.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Text(
                                              firebaseItemList[index].city,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                9.0, 1.0, 5.0, 5.0),
                                            height: 26.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Text(
                                              firebaseItemList[index]
                                                      .price
                                                      .toString() +
                                                  ' ₺',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.black38),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          firebaseItemList[index]
                                              .dtime
                                              .toDate()
                                              .toUtc()
                                              .toString(),
                                          style: TextStyle(fontSize: 5.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          )));
                });
          }));
}
