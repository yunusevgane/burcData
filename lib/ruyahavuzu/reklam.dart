import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

Future<void> resimReklam() async {
  String? token = await FirebaseMessaging.instance.getToken();
  String userid = "";
  userid = "";

  var dataVar = FirebaseFirestore.instance;
  dataVar.collection('reklam').doc().set({
    'tarih': new DateTime.now(),
    'reklam': 'admob',
    'tipi': 'resimReklam',
    'token': token,
    'uid': userid,
  });

  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-9410328109595500/4727920139'
          : 'ca-app-pub-9410328109595500/4727920139',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _isAdLoaded = true;
          if (_isAdLoaded) {
            _interstitialAd.show();
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: error');
        },
      ));
}

/// This example demonstrates anchored adaptive banner ads.
class BannerReklam extends StatefulWidget {
  @override
  _BannerReklamState createState() => _BannerReklamState();
}

class _BannerReklamState extends State<BannerReklam> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    String? token = await FirebaseMessaging.instance.getToken();
    String userid = "";
     userid = "";

    var dataVar = FirebaseFirestore.instance;
    dataVar.collection('reklam').doc().set({
      'tarih': new DateTime.now(),
      'reklam': 'admob',
      'tipi': 'banner',
      'token': token,
      'uid': userid,
    });

    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    _anchoredAdaptiveAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-9410328109595500/4919491823'
          : 'ca-app-pub-9410328109595500/4919491823',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    if (_anchoredAdaptiveAd != null &&
        _isLoaded ) {
      return Container(
        color: Colors.white,
        width: _anchoredAdaptiveAd!.size.width.toDouble(),
        height: _anchoredAdaptiveAd!.size.height.toDouble(),
        child: AdWidget(ad: _anchoredAdaptiveAd!),
      );
    } else {
      return const SizedBox(
        height: 1,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }
}
