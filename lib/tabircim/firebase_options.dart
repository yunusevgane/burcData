// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxLU79gMrmdjWoPRvnI0fHuUuaE-gUBjo',
    appId: '1:396948459576:android:157b760c53a3a8c455d6cd',
    messagingSenderId: '396948459576',
    projectId: 'ruyahavuzu',
    databaseURL: 'https://ruyahavuzu-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'ruyahavuzu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBX0O3GBdxKZkCwLTZ4XhoZZvXUoWKS26E',
    appId: '1:396948459576:ios:8ab43d7b5c4abbb155d6cd',
    messagingSenderId: '396948459576',
    projectId: 'ruyahavuzu',
    databaseURL: 'https://ruyahavuzu-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'ruyahavuzu.appspot.com',
    iosClientId: '396948459576-io8icp8ur1kpb90tr5jncfn8k28kf9t3.apps.googleusercontent.com',
    iosBundleId: 'com.webyapar.ruyatabirleri',
  );
}
