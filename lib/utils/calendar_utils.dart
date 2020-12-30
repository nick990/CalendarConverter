class CalendarUtils {
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

  static String getMayaLongCount(int jd) {
    //August 11, 3114 BC
    //CalendarUtils.getJulianDayFromDateTime(new DateTime(-3113, 8, 11));
    int creationJD = 584282;
    int dayElapsed = jd - creationJD;
    int baktun, katun, tun, uinal, kin;
    baktun = dayElapsed ~/ 144000;
    dayElapsed -= (baktun * 144000);
    katun = dayElapsed ~/ 7200;
    dayElapsed -= (katun * 7200);
    tun = dayElapsed ~/ 360;
    dayElapsed -= (tun * 360);
    uinal = dayElapsed ~/ 20;
    dayElapsed -= (uinal * 20);
    kin = dayElapsed;
    return "$baktun.$katun.$tun.$uinal.$kin";
  }
}
