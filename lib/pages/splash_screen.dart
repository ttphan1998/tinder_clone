
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinder_clone/pages/login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:tinder_clone/pages/root_app.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(new Duration(seconds: 2),(){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen())) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context) ;

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: new Center(
        child: new Image(
          width: ScreenUtil().setWidth(200.0),
          height: ScreenUtil().setHeight(200.0),
          image: new AssetImage('assets/images/tinder_logo.png'),
        ),
      ),
    );
  }
}