class PhoneNumberHelper {
  static String convertPhoneNumber(String phoneNumber) {
    if (phoneNumber.substring(0, 1) == '0') {
      return phoneNumber.replaceFirst('0', '+66');
    }
    return phoneNumber;
  }

  static String hidePhoneNumber(String phoneNumber) {
    final hiddenPart = phoneNumber
        .substring(0, phoneNumber.length - 3)
        .split("")
        .map((e) => "X")
        .join();
    final hiddenNumber = hiddenPart.replaceAllMapped(
            RegExp(r".{3}"), (match) => "${match.group(0)} ") +
        phoneNumber.substring(phoneNumber.length - 3);
    return hiddenNumber;
  }

  static String hidePhoneNumberV2(String phoneNumber) {
    String hiddenPart = 'XXX XXX X';
    String showNumber = phoneNumber.substring(phoneNumber.length - 3);
    String formattedPhoneNumber = '$hiddenPart$showNumber';
    return formattedPhoneNumber;
  }
}
