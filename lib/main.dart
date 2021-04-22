import 'package:flutter/material.dart';
import 'package:tinder_clone/pages/login_screen.dart';
import 'package:tinder_clone/pages/root_app.dart';
import 'package:tinder_clone/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tinder Clone',
    theme: ThemeData(
        primaryColor: Color.fromRGBO(253, 41, 123, 1.0),
        secondaryHeaderColor: Color.fromRGBO(255, 88, 100, 1.0),
        accentColor: Color.fromRGBO(255, 101, 91, 1.0)
    ),
    home: SplashScreen(),
  ));
}
