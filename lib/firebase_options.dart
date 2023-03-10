// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, no_default_cases
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSlSYSeoa9fA43KGdCPov3LtAMeXQZ0BY',
    appId: '1:1082842985559:android:3fc5562c1d27d170471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    storageBucket: 'hideyuki-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-N8lZNZRZl5PCVMAhxTkA_edocgPYm7Q',
    appId: '1:1082842985559:ios:40ba93032b9fbef0471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    storageBucket: 'hideyuki-firebase.appspot.com',
    iosClientId:
        '1082842985559-m70tbgrl995almhbmeaqs6l2io130e99.apps.googleusercontent.com',
    iosBundleId: 'com.example.schedule',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-N8lZNZRZl5PCVMAhxTkA_edocgPYm7Q',
    appId: '1:1082842985559:ios:40ba93032b9fbef0471f12',
    messagingSenderId: '1082842985559',
    projectId: 'hideyuki-firebase',
    storageBucket: 'hideyuki-firebase.appspot.com',
    iosClientId:
        '1082842985559-m70tbgrl995almhbmeaqs6l2io130e99.apps.googleusercontent.com',
    iosBundleId: 'com.example.schedule',
  );
}
