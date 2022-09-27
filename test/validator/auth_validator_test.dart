import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/validator/auth_validator.dart';
//!Unit test
main(){
 
 group('login test', (){
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
 });
  
  group('sign up test', (){
    test('email field cannot be empty', (){
      // Arrange 
      var email = '';
      //act
      var result = AuthValidator.validateEmail(email);
      //assert
      expect(result, 'Required field');
    });

     test('full Name field cannot be empty', (){
      // Arrange 
      var name = '';
      //act
      var result = AuthValidator.validateName(name);
      //assert
      expect(result, 'Required field');
    });
 test('country field cannot be empty', (){
      // Arrange 
      var country = '';
      //act
      var result = AuthValidator.validateContry(country);
      //assert
      expect(result, 'Required field');
    });

     test('city field cannot be empty', (){
      // Arrange 
      var city = '';
      //act
      var result = AuthValidator.validateCity(city);
      //assert
      expect(result, 'Required field');
    });

test('address field can be empty', (){
      // Arrange 
      var address = '';
      //act
      var result = AuthValidator.validateAddress(address);
      //assert
      expect(result, null);
    });

   test('password field cannot be empty', (){
      // Arrange 
      var password = '';
      //act
      var result = AuthValidator.validatePassword(password);
      //assert
      expect(result, 'Required field');
    });

     test('invalid email test', (){
      // Arrange 
      var email= '12345';
      //act
      var result = AuthValidator.validateEmail(email);
      //assert
      expect(result, 'Please enter a valid email');
    });

     test('valid email test', (){
      // Arrange 
      var email= 'wewe@we.we';
      //act
      var result = AuthValidator.validateEmail(email);
      //assert
      expect(result, null);
    });

    test('invalid password test', (){
      // Arrange 
      var password= 'me';
      //act
      var result = AuthValidator.validatePassword(password);
      //assert
      expect(result, 'Please enter at least 8 characters for password');
    });

 test('valid password test', (){
      // Arrange 
      var password= 'me#myboo123';
      //act
      var result = AuthValidator.validatePassword(password);
      //assert
      expect(result, null);
    });

  });

 



}

