mixin FormValidationHelper {
  bool isNameValid(String value) => value.length >= 3;
  bool isSurnameValid(String value) => value.length >= 2;
  bool isEmailValid(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(pattern).hasMatch(value);
  }

  bool isPasswordValid(String value) => value.length >= 6;
  bool isCodeValid(String value) => value.length >= 2;
  bool isPhoneValid(String value) => value.length == 9;
  bool isNotEmptyValid(String? value) => value != null && value.isNotEmpty;
}
