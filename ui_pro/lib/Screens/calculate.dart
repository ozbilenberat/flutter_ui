import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Kazanç Hesaplama';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              appTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: AddTwoNumbers(),
      ),
    );
  }
}

class AddTwoNumbers extends StatefulWidget {
  @override
  _AddTwoNumbersState createState() => _AddTwoNumbersState();
}

class _AddTwoNumbersState extends State<AddTwoNumbers> {
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  String resulttext = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Column(children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Fındık miktarı(kg):',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 40.0,
                    child: new TextField(
                      decoration: InputDecoration(
                          hoverColor: Colors.red,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 5.0),
                          )),
                      keyboardType: TextInputType.number,
                      controller: num1controller,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Satış fiyatı:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 40.0,
                    child: new TextField(
                      decoration: InputDecoration(
                          hoverColor: Colors.red,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 5.0),
                          )),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^\d*\.?\d*)')),
                      ],
                      controller: num2controller,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "Hesapla",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(() {
                        double result = int.parse(num1controller.text) *
                            double.parse(num2controller.text);
                        resulttext = result.toString() + (' TL');
                      });
                    },
                  ),
                ],
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kazanç:",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              new Text(
                resulttext,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
