import 'package:flutter/material.dart';
import '/tabirdunyasi/arama.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  _anasayfaState createState() => _anasayfaState();
}

final TextEditingController text = TextEditingController();

class _anasayfaState extends State<anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff013233),
      body: Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/tabirdunyasi/home1.png',
                  fit: BoxFit.cover)),
          Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/tabirdunyasi/home2.png',
                  fit: BoxFit.fill)),
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
                      style: TextStyle(
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
                            TextStyle(fontSize: 20.0, color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: CircleAvatar(
                          backgroundColor: Color(0xff008C8F),
                          child: IconButton(
                              icon: Icon(Icons.search),
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