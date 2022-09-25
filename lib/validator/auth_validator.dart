class AuthValidator {
 
  static String? validateEmail(String email) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if(email.isEmpty){
      return 'Required field';
    }
    if(!regExp.hasMatch(email)){
        return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String password) {

    if (password.isEmpty){
      return 'Required field';
    }

    if(password.length < 8){
      return'Please enter at least 8 characters for password';
    }
    return null;
  }
}