import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/material.dart';
import '/ruyahavuzu/reklam.dart';
import '/ruyahavuzu/arama.dart';

class detay extends StatefulWidget {
  String ara;
  String detays;

  detay({Key? key, required this.ara, required this.detays}) : super(key: key);

  @override
  _detayState createState() => _detayState();
}

class _detayState extends State<detay> {
  final TextEditingController text = TextEditingController();

  @override
  void initState() {
    super.initState();
    resimReklam();
  }

  @override
  Widget build(BuildContext context) {
    text.text = widget.ara;
    String chattext = text.text;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff1d71b8),
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          alignment: Alignment.topCenter,
          child: aramainput(context),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 0, top: 70, left: 20, right: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color(0xff1d71b8),
            ),
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 20.0, top: 20.0),
            child: HtmlWidget(
              widget.detays,
              textStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
        ),
      ]),
    );
  }

  Container aramainput(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Container(
          
          
          padding: const EdgeInsets.only(
              left: 0.0, right: 5.0, top: 5.0, bottom: 5.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xff1d71b8),
                blurRadius: 10,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
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
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
              border: InputBorder.none,
              suffixIcon: CircleAvatar(
                backgroundColor: Color(0xff1d71b8),
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
    );
  }
}


// SingleChildScrollView