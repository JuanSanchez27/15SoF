// ignore: avoid_classes_with_only_static_members
class Strings {
  static String get title => 'Template app';

  static String get pressPlsButton => 'Press Plus button';

  static String get skipCount => 'Skip Count';

  static String getCount(int count) => 'Count: $count';

  static String get getTitle => 'Get Title';

  static String getTitleString(String title) => 'Title: $title';

  static String get fieldIsRequired => 'This field is required';

  static String get incorrectEmail => 'Please enter a valid email address';

  static String get incorrectPassword => 'The password must be a minimum of 8 '
      'characters with at least one number, lowercase and uppercase letters. '
      'Special characters [! @ # \$ & ( ) . + , / -] are allowed';

  static String get incorrectZipCode => 'Please enter a valid zip code';

  static String get incorrectPhoneNumber => 'Incorrect phone number format';

  static String get passwordAreDifferent => 'Passwords do not match';
}
