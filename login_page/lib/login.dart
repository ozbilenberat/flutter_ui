import 'package:login_page/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            themeNotifier.isDark ? "Dark Mode" : "Light Mode",
            style: TextStyle(
                color:
                    themeNotifier.isDark ? Colors.white : Colors.grey.shade900),
          ),
          actions: [
            IconButton(
                icon: Icon(
                    themeNotifier.isDark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color: themeNotifier.isDark
                        ? Colors.white
                        : Colors.grey.shade900),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: size.height * 0.2,
                top: size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hoşgeldiniz",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: size.width * 0.1,
                        )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                            width: 30,
                            image: AssetImage('assets/icons/google.png')),
                        SizedBox(width: 40),
                        Image(
                            width: 30,
                            image: AssetImage('assets/icons/facebook.png'))
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email veya telefon numarası"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Sifre"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sifremi unuttum",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () => {},
                      elevation: 0,
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        "Giriş",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text("Hesap oluştur",
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
