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
        return macos;
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
    apiKey: 'AIzaSyBMvrotXQk4DKn3cGZxsmEMxM9GgTMuFKo',
    appId: '1:406158064910:web:1f406d9334b518f97deb5f',
    messagingSenderId: '406158064910',
    projectId: 'the-crown-b8973',
    authDomain: 'the-crown-b8973.firebaseapp.com',
    storageBucket: 'the-crown-b8973.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2k32eDgGvZFgzYB-u0zi-acYI6Iip-b8',
    appId: '1:406158064910:android:96de475805c38a1c7deb5f',
    messagingSenderId: '406158064910',
    projectId: 'the-crown-b8973',
    storageBucket: 'the-crown-b8973.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6AxyyCnVX9AMIyurEWvsjCMgmla_6x4c',
    appId: '1:406158064910:ios:a1c7e1ca4609e6cb7deb5f',
    messagingSenderId: '406158064910',
    projectId: 'the-crown-b8973',
    storageBucket: 'the-crown-b8973.appspot.com',
    iosBundleId: 'com.example.myTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6AxyyCnVX9AMIyurEWvsjCMgmla_6x4c',
    appId: '1:406158064910:ios:b5128372d27ea79d7deb5f',
    messagingSenderId: '406158064910',
    projectId: 'the-crown-b8973',
    storageBucket: 'the-crown-b8973.appspot.com',
    iosBundleId: 'com.example.myTodo.RunnerTests',
  );
}
