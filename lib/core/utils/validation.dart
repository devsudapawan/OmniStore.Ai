class AppValidator {


  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
// Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@C[\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }




  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if(value.length < 6){
      return "Password must be at least 6 characters long.";
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    if(value.length < 10){
      return "Phone number must be at least 10 characters long.";
    }
  }
}