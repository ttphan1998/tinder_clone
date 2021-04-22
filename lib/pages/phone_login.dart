import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinder_clone/pages/root_app.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sweetalert/sweetalert.dart';

class PhoneNumberScreen extends StatelessWidget {
  final phoneNumber = TextEditingController();
  final countryCode = TextEditingController();
  static String errorMessage = "";
  static bool loginResult = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: new IconButton(icon:
        new Icon(Icons.arrow_back,color : Theme.of(context).primaryColor)
            , onPressed: (){
              Navigator.pop(context);
            }),
        elevation: 0.0,
      ),
      body: new Padding(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Expanded(
                flex: 5,
                child: new Column(
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "My number is",
                        style: new TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                    ),
                    new SizedBox(
                      height: 80.0,
                    ),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 3,
                          child: new TextField(
                            key: Key('Country code'),
                            controller: countryCode,
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: new InputDecoration(
                                prefixIcon: new Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                helperText: 'Country code'),
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Expanded(
                            flex: 7,
                            child: new TextField(
                              key: Key('Phone number'),
                              controller: phoneNumber,
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: new InputDecoration(
                                  helperText: 'Phone number'),
                            )),
                      ],
                    ),
                    new SizedBox(
                      height: 32,
                    ),
                    new Text(
                      'When you tap "Continue",Tinder will send a text a with verification code. Message and data rates may apply.\nThe verified phone number can be used to log in. Learn what happens when your number changes.',
                      style: new TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    new SizedBox(
                      height: 23,
                    ),
                    new GestureDetector(
                      onTap: () => phoneLogin(context),
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(90.0),
                            gradient: new LinearGradient(
                                colors: [
                                  Theme.of(context).accentColor,
                                  Theme.of(context).secondaryHeaderColor,
                                  Theme.of(context).primaryColor
                                ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [0.0, 0.1, 1.0])),
                        width: double.infinity,
                        height: 52,
                        child: Center(
                          child: new Text(
                            "CONTINUE",
                            key: Key('CONTINUE'),
                            style: new TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w600,
                                fontSize: 23),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
  String phoneLogin(BuildContext context){
    if(phoneNumber.text == "" && countryCode.text == ""){
      errorMessage = "Please type your phone number";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if (countryCode.text == ""){
      errorMessage = "Country code must not be empty";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if(phoneNumber.text == ""){
      errorMessage = "Phone number must not be empty";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if(phoneNumber.text.length != 9 && countryCode.text.length != 2){
      errorMessage = "Phone number and country code is invalid";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if(phoneNumber.text.length != 9){
      errorMessage = "Phone number is invalid";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if(countryCode.text.length != 2){
      errorMessage = "Country code is invalid";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);

    }
    else if(phoneNumber.text.length == 9 && countryCode.text.length == 2){
      errorMessage = null;
      loginResult = true;
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage()));
    }
    return null;
  }
}
