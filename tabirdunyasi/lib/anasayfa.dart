import 'package:flutter/material.dart';
import '/arama.dart';
import 'package:intl/intl.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  _anasayfaState createState() => _anasayfaState();
}

final TextEditingController text = TextEditingController();

List burcyorum = [];
Map burclar = {};
String version = "";

String dil = "tr";
String dosya = "";

DateTime now = DateTime.now();
String baslik = DateFormat('dd / MM / yyyy').format(now);

class _anasayfaState extends State<anasayfa>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff013233),
      body: Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/home1.png', fit: BoxFit.cover)),
          Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/home2.png', fit: BoxFit.fill)),
          Container(
            alignment: Alignment.center,
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 50.0),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 5.0, top: 5.0, bottom: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: TextField(
                      controller: text,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),

                      onSubmitted: (_) {
                        String chattext = text.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => arama(
                              ara: chattext,
                            ),
                          ),
                        );
                      }, // submit and hide keyboard

                      decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(fontSize: 20.0, color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: CircleAvatar(
                          backgroundColor: const Color(0xff008C8F),
                          child: IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.white,
                              onPressed: () {
                                String chattext = text.text;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => arama(
                                      ara: chattext,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        hintText: 'Rüya Ara',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
