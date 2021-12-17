import 'package:firebase_parth/home.dart';
import 'package:firebase_parth/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_parth/first.dart';
import 'package:firebase_parth/login.dart';
import 'package:firebase_parth/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_parth/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'first',
    routes: {
      'first': (context) => MyFirst(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => MyHome(),
      'profile': (context) => Profile(),
    },
  ));
}
