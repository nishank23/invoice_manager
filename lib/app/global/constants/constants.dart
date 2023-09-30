class Constant {
  static const mobilenumber = "mobileNumber";

  static const tokenKey = "token";
  static const userId = "userId";
  static const companyName = "companyName";
  static const userPhoto = "userPhoto";
  static const userNo = "userNo";
  static const fcmKey = "fcmKey";
  static const backNotification = "backNotification";
  static const fcmValue = "fcmValue";

  static String isAlreadyLoggedIn = "isAlreadyLoggedIn";
  static String isProfileUpdated = "isProfileUpdated";

  static bool validateEmail(String email) {
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );

    if (!emailRegex.hasMatch(email)) {
      // Invalid email format
      print('Invalid email address.');
      return false;
    }

    // Email is valid
    return true;
  }
}
