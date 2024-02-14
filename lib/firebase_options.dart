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
    apiKey: 'AIzaSyDoD3lrMIzQrMtD8ynJ3F6pitkgIubrlr8',
    appId: '1:1024919465405:android:a37d9b65c528e0c315b6d4',
    messagingSenderId: '1024919465405',
    projectId: 'learn-6c78b',
    databaseURL: 'https://learn-6c78b.firebaseio.com',
    storageBucket: 'learn-6c78b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuPVu8JzPe2-4x2gJdR1Dkq7nAdzh4hpY',
    appId: '1:1024919465405:ios:5540ddd2c17014f315b6d4',
    messagingSenderId: '1024919465405',
    projectId: 'learn-6c78b',
    databaseURL: 'https://learn-6c78b.firebaseio.com',
    storageBucket: 'learn-6c78b.appspot.com',
    androidClientId: '1024919465405-0umm5s3o8foqlsn6875185421dgk5v88.apps.googleusercontent.com',
    iosClientId: '1024919465405-41gq4vsq5hj4fendop0ecr7scdeo6ro5.apps.googleusercontent.com',
    iosBundleId: 'com.lubshad.academy',
  );
}
