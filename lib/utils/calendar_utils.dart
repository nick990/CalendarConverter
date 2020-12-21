class CalendarUtils {
  //August 11, 3114 BC
  static getJulianDayFromDateTime(DateTime date) {
    int julianDay;
    int a = (date.year / 100).floor();
    int b = (a / 4).floor();
    int c = 2 - a + b;
    int e = (365.25 * (date.year + 4716)).floor();
    int f = (30.6001 * (date.month + 1)).floor();
    julianDay = (c + date.day + e + f - 1524.5).floor();
    return julianDay;
  }

  /// Format the [number] and return it as [String].
  /// Digit grouping symbol = '.'
  static String formatNumber(int number) {
    var numberAsString = number.toString();
    print(numberAsString);
    var formattedString = "";
    for (int i = 0; i < numberAsString.length; i++) {
      formattedString += numberAsString[i];
      if ((i != numberAsString.length - 1) &&
          (numberAsString.length - i - 1) % 3 == 0) {
        formattedString += ".";
      }
    }
    return formattedString;
  }
}
