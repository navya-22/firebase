// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCXtceoJUh4_v4TNEBQfR60pE49M_pCmE8',
    appId: '1:1032381855252:web:15d5209a13a70f4c345901',
    messagingSenderId: '1032381855252',
    projectId: 'basic-fire-6fca5',
    authDomain: 'basic-fire-6fca5.firebaseapp.com',
    storageBucket: 'basic-fire-6fca5.appspot.com',
    measurementId: 'G-BG7RDZTGVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA27l1YkDbQr0gIc_FqKg5Bj94jzzgErME',
    appId: '1:1032381855252:android:a8d12259e07ad9f3345901',
    messagingSenderId: '1032381855252',
    projectId: 'basic-fire-6fca5',
    storageBucket: 'basic-fire-6fca5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvsWRYFGl2JU1RsaBpruP0Y3XD1pEyEIo',
    appId: '1:1032381855252:ios:ce36c05d6bf1a1e8345901',
    messagingSenderId: '1032381855252',
    projectId: 'basic-fire-6fca5',
    storageBucket: 'basic-fire-6fca5.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvsWRYFGl2JU1RsaBpruP0Y3XD1pEyEIo',
    appId: '1:1032381855252:ios:ce36c05d6bf1a1e8345901',
    messagingSenderId: '1032381855252',
    projectId: 'basic-fire-6fca5',
    storageBucket: 'basic-fire-6fca5.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCXtceoJUh4_v4TNEBQfR60pE49M_pCmE8',
    appId: '1:1032381855252:web:26326f532ddcd03a345901',
    messagingSenderId: '1032381855252',
    projectId: 'basic-fire-6fca5',
    authDomain: 'basic-fire-6fca5.firebaseapp.com',
    storageBucket: 'basic-fire-6fca5.appspot.com',
    measurementId: 'G-FV56V300VW',
  );
}
