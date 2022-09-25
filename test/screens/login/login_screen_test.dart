import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/screens/login/login_screen.dart';
//!Widget Test
void main() {

  //!Finding widget by text
  testWidgets(
    "login screen should have two widgets with Login test",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      //act
      Finder text = find.text('Login');

      //assert
      expect(text, findsNWidgets(2));
    },
  );

//!Finding widget by key
 testWidgets(
    "login screen should have textFormField for email test",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      //act
      Finder key = find.byKey(const ValueKey('email'));

      //assert
      expect(key, findsOneWidget);
    },
  );

  //!Find widget by type
   testWidgets(
    "login screen should have 2 elevated button test",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      //act
      Finder button = find.byType(ElevatedButton);

      //assert
      expect(button, findsNWidgets(2));
    },
  );
  
  testWidgets('should show error if tapped without password and email', (WidgetTester tester)async{
  //arrange
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      //act
      Finder loginBtn = find.byKey(const ValueKey('login_btn'));
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();
      Finder errorText = find.text('Required field');

      //assert
      expect(errorText, findsAtLeastNWidgets(1));

  });

 testWidgets('should submit form if correct fields are provided for email and password', (WidgetTester tester)async{
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
      Finder errorText = find.text('Required field');

      //assert
      expect(errorText, findsNothing);

  });


}