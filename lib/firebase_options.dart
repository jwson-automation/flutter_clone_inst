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
    apiKey: 'AIzaSyCwe4xJCJ4C3zUAw6LN3UUdv0pbCy4-9Q4',
    appId: '1:317476872634:android:06b32d7e0842a22294bd83',
    messagingSenderId: '317476872634',
    projectId: 'clone-coding-instagram-jwson',
    storageBucket: 'clone-coding-instagram-jwson.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhD_fksbvesgikuYqjYdOWaH6k8yNUr_k',
    appId: '1:317476872634:ios:ba5e5c59b922aabd94bd83',
    messagingSenderId: '317476872634',
    projectId: 'clone-coding-instagram-jwson',
    storageBucket: 'clone-coding-instagram-jwson.appspot.com',
    iosClientId: '317476872634-0bn5efs15r39k49lfs79s8hl1p7t1vt7.apps.googleusercontent.com',
    iosBundleId: 'com.instaclone.flutterCloneInst',
  );
}
