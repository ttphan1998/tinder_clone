import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:tinder_clone/pages/login_screen.dart';
import 'package:tinder_clone/pages/phone_login.dart';

void main(){
  group('Phone login screen',(){
    FlutterDriver driver;

    final continueButton = find.byValueKey(ValueKey("CONTINUE"));
    final phoneNumber = find.byValueKey(ValueKey("Phone number"));
    final countryCode = find.byValueKey(ValueKey("Country code"));

    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async{
      if (driver != null){
        driver.close();
      }
    });
    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
    test('Phone login', () async{
      await driver.tap(countryCode);
      await driver.enterText("84");
      await driver.tap(phoneNumber);
      await driver.enterText("0123456789");
      await driver.tap(continueButton);
      expect(PhoneNumberScreen.loginResult, true);
    });
  });
}