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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDtYEQvCqd6n2D9Bc_hijJRAEExCUEPDB0',
    appId: '1:142612857159:web:19cea501362991c0fb4c62',
    messagingSenderId: '142612857159',
    projectId: 'nsm-backend-d2777',
    authDomain: 'nsm-backend-d2777.firebaseapp.com',
    storageBucket: 'nsm-backend-d2777.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuvISERBgiv5xp0jUBARKNd_M2ByyjGLs',
    appId: '1:142612857159:android:4793eecfb0af706bfb4c62',
    messagingSenderId: '142612857159',
    projectId: 'nsm-backend-d2777',
    storageBucket: 'nsm-backend-d2777.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAez7zKC29ucdsw1TlREtGKE4HqUoksIgk',
    appId: '1:142612857159:ios:88345012d4008469fb4c62',
    messagingSenderId: '142612857159',
    projectId: 'nsm-backend-d2777',
    storageBucket: 'nsm-backend-d2777.appspot.com',
    iosBundleId: 'com.example.nsmMessenger',
  );
}