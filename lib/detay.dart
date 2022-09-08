import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/material.dart';
import '/arama.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    text.text = widget.ara;
    String chattext = text.text;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xff2d5c5d),
      ),
      body: Stack(children: [
        Container(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/ic1.png', fit: BoxFit.cover)),
        Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/ic2.png', fit: BoxFit.fill)),
        Container(
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.topCenter,
          child: aramainput(context),
        ),
        Container(
          margin:
              const EdgeInsets.only(bottom: 100, top: 100, left: 20, right: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
              child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color(0xff2C5C5C),
            ),
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 20.0, top: 20.0),
            child: HtmlWidget(
              widget.detays,
              textStyle: const TextStyle(
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
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              hintStyle: const TextStyle(fontSize: 20.0, color: Colors.grey),
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
    );
  }
}

// SingleChildScrollView
