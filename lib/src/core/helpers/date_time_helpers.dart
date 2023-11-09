class DateTimeHelpers {
  static String getLocalTimezoneOffset() {
    final now = DateTime.now().timeZoneOffset;
    final offsetHours = now.inHours.toString().padLeft(2, '0');
    final offsetMinutes = (now.inMinutes % 60).toString().padLeft(2, '0');
    final offsetSign = now.isNegative ? '-' : '+';
    return 'UTC$offsetSign$offsetHours:$offsetMinutes';
  }
}
