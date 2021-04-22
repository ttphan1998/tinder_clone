import 'package:flutter_test/flutter_test.dart';
import 'package:tinder_clone/pages/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:tinder_clone/main.dart';
import 'package:tinder_clone/pages/login_screen.dart';
import 'package:tinder_clone/pages/phone_login.dart';
import 'package:tinder_clone/pages/splash_screen.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main(){
  testWidgets("Login screen", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(find.text("tinder"), findsWidgets);
  });
  testWidgets("Login screen phone login button", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(find.text("LOG IN WITH PHONE NUMBER"), findsWidgets);
  });
  testWidgets("Login screen email login button", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(find.text("LOG IN WITH EMAIL"), findsNothing);
  });
  testWidgets("Phone login empty phone number", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "84");
    await tester.enterText(phoneNumber, "");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.errorMessage, "Phone number must not be empty");
  });
  testWidgets("Phone login empty country code", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "");
    await tester.enterText(phoneNumber, "0123456789");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.errorMessage, "Country code must not be empty");
  });
  testWidgets("Phone login empty phone number and country code", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "");
    await tester.enterText(phoneNumber, "");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.errorMessage, "Please type your phone number");
  });
  testWidgets("Phone login correctly", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "84");
    await tester.enterText(phoneNumber, "0123456789");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.loginResult, true);
  });
  testWidgets("Phone login country code invalid", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "84123123");
    await tester.enterText(phoneNumber, "0123456789");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.errorMessage, "Country code is invalid");
  });
  testWidgets("Phone login phone number invalid", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "84");
    await tester.enterText(phoneNumber, "012");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.errorMessage, "Phone number is invalid");
  });
  testWidgets("Phone login phone number and country code invalid", (WidgetTester tester) async{
    final continueButton = find.byKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byKey(ValueKey("Phone number"));
    final countryCode = find.byKey(ValueKey("Country code"));

    await tester.pumpWidget(MaterialApp(home: PhoneNumberScreen()));
    await tester.enterText(countryCode, "8421321");
    await tester.enterText(phoneNumber, "012");
    await tester.tap(continueButton);
    expect(PhoneNumberScreen.errorMessage, "Phone number and country code is invalid");
  });
}