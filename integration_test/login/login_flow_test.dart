import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_app/screens/login/login_screen.dart';

void main() {
  group(
    "login flow test",
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

       testWidgets('should show error message to user when invalid email and password is provided', (tester)async{
           //arrange
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      //act
      Finder emailTextField = find.byKey(const ValueKey('email'));
      Finder passwordTextField = find.byKey(const ValueKey('password'));

      await tester.enterText(emailTextField, '');
      await tester.enterText(passwordTextField, 'pass');


      Finder loginBtn = find.byKey(const ValueKey('login_btn'));
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();

      Finder errorText = find.text('Required field');

      //assert
      expect(errorText, findsAtLeastNWidgets(1));
      });
  

      testWidgets('should navigate user to homescreen when valid email and password is provided', (tester)async{
           //arrange
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      //act
      Finder emailTextField = find.byKey(const ValueKey('email'));
      Finder passwordTextField = find.byKey(const ValueKey('password'));

      await tester.enterText(emailTextField, 'danzobit@github.com');
      await tester.enterText(passwordTextField, 'password');


      Finder loginBtn = find.byKey(const ValueKey('login_btn'));
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();

      Finder appTitle = find.text('E-shop');

      //assert
      expect(appTitle, findsOneWidget);
      });
    },
  );
}