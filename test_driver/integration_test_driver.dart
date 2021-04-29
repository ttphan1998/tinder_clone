import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:tinder_clone/pages/phone_login.dart';
void main(){
  group('Phone login screen',(){
    FlutterDriver driver;

    final continueButton = find.byValueKey("CONTINUE");
    final phoneNumber = find.byValueKey("Phone number");
    final countryCode = find.byValueKey("Country code");

    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async{
      if (driver != null){
        driver.close();
      }
    });
    test('Phone login', () async{
      await driver.tap(countryCode);
      await driver.enterText("84");
      await driver.tap(phoneNumber);
      await driver.enterText("123456789");
      await driver.tap(continueButton);
      //expect(PhoneNumberScreen.loginResult, true);
    }, timeout: Timeout(Duration(seconds:  10)));
  });
}
