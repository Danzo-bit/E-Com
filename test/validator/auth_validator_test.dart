import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/validator/auth_validator.dart';
//!Unit test
main(){
 
  test('empty email test',(){
    //Arrange and act
    var email = '';
    var result = AuthValidator.validateEmail(email);

    //Assert
    expect(result, 'Required field');
  } );

   test('invalid email test',(){
    //Arrange and act
    var email = 'hgygwdgyvkxut';
    var result = AuthValidator.validateEmail(email);

    //Assert
    expect(result, 'Please enter a valid email');
  } );

    test('valid email test',(){
    //Arrange and act
    var email = 'me123@abc.com';
    var result = AuthValidator.validateEmail(email);

    //Assert
    expect(result, null);
  } );

 test('empty password test',(){
    //Arrange and act
    var password = '';
    var result = AuthValidator.validatePassword(password);

    //Assert
    expect(result, 'Required field');
  } );

 test('invalid password test',(){
    //Arrange and act
    var password = 'pass';
    var result = AuthValidator.validatePassword(password);

    //Assert
    expect(result, 'Please enter at least 8 characters for password');
  } );

test('valid password test',(){
    //Arrange and act
    var password = 'password';
    var result = AuthValidator.validatePassword(password);

    //Assert
    expect(result, null);
  } );



}

