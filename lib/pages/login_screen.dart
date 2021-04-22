import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinder_clone/data/tinder_clone_icons.dart';
import 'package:tinder_clone/pages/phone_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:tinder_clone/pages/root_app.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookLogin fbLogin = new FacebookLogin();
  bool isFacebookLoginIn = false;
  String errorMessage = '';
  String successMessage = '';

  Future<User> facebookLogin(BuildContext context) async{
    User currentUser;
    try {
      final FacebookLoginResult facebookLoginResult =
      await fbLogin.logIn(['email']);
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        FacebookAccessToken facebookAccessToken =
            facebookLoginResult.accessToken;
        AuthCredential credential = FacebookAuthProvider.credential(
           facebookAccessToken.token);
        User user = (await auth.signInWithCredential(credential)).user;
        print("signed in" + user.displayName);
        return user;
      }
    } catch (e) {
      print(e);
    }
    return currentUser;
  }

  Future<bool> facebookLogout() async {
    await auth.signOut();
    await fbLogin.logOut();
    return true;
  }


  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>() ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).secondaryHeaderColor,
                    Theme.of(context).primaryColor
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.35, 1.0])),
          child: new Column(
            children: <Widget>[
              new Expanded(
                  flex: 5,
                  child: Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Tinder_clone.iconfinder_338_tinder_logo_4375488__1_,
                            color: Colors.white,
                            size: 60,
                          ),
                          new SizedBox(width: 0),
                          new Text(
                            "tinder",
                            style: new TextStyle(
                                fontSize: 60,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ))),
              new Expanded(
                  flex: 3,
                  child: new Padding(
                    padding: EdgeInsets.all(30),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'By clicking "Log in",you agree with our Terms.\n Learn how we process your data in our Privacy  Policy and Cookies Policy',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        new SizedBox(height: 10),
                        new Container(
                          width: double.infinity,
                          height: 30,
                          child: new RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            color: Colors.white,
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PhoneNumberScreen()));
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "LOG IN WITH PHONE NUMBER",
                                  style: new TextStyle(
                                      color: Colors.grey, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                        new SizedBox(height: 15.0),
                        new Container(
                          width: double.infinity,
                          height: 30,
                          child: new RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90.0)),
                            color: Colors.white,
                            elevation: 0.0,
                            onPressed: () {
                              facebookLogin(context).then((user) {
                                if (user != null){
                                  print('Logged in successfully.');
                                  setState(() {
                                    isFacebookLoginIn = true;
                                    successMessage =
                                    'Logged in successfully.\nEmail : ${user.email}\nYou can now navigate to Home Page.';
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RootPage()));
                                } else{
                                  print('Error while login.');
                                }
                              });
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "LOG IN WITH FACEBOOK",
                                  style: new TextStyle(
                                      color: Colors.grey, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                        new SizedBox(height: 15),
                        new Text(
                          "Trouble logging in?",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
