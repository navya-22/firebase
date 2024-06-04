import 'package:firebase/screens/detail.dart';
import 'package:firebase/screens/home.dart';
import 'package:firebase/screens/screen1.dart';
import 'package:firebase/screens/sign%20in.dart';
import 'package:firebase/screens/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(
    
      FirebasePhoneAuthProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignIn(),
          ),
      ));
}

