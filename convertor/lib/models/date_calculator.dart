class DateCalculator {
  DateTime date;

  DateCalculator(this.date);

  Map<String, Object> calculDate(DateTime date2) {
    Duration difference = date2.difference(this.date);
    int day = difference.inDays;
    String month = (day / 30).toStringAsFixed(2);
    String year = (day / 365).toStringAsFixed(2);

    return {'day': day, 'month': month, 'year': year};
  }
}
