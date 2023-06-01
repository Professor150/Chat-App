bool validateEmail(String email) {
  // Regular expression pattern for email validation
  // This pattern matches most common email formats
  const pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

bool validatePassword(String password) {
  // Regular expression pattern for password validation
  // This pattern enforces at least 8 characters and
  // at least one uppercase letter, one lowercase letter, one special character
  // and one digit.
  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}

bool validatePhoneNumber(String phoneNumber) {
  // Regular expression pattern for phone number validation
  // This pattern enforces 10 digits phone number format
  const pattern = r'^[0-9]{10}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(phoneNumber);
}
