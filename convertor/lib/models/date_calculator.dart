class DateCalcul {
  DateTime date;

  DateCalcul(this.date);

  Map<String, int> calculDateDifference(DateTime dateToCompareTo) {
    int years = dateToCompareTo.year - this.date.year;
    int months = dateToCompareTo.month - this.date.month;
    int days = dateToCompareTo.day - this.date.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }
    if (days < 0) {
      DateTime monthAgo = DateTime(
          dateToCompareTo.year, dateToCompareTo.month - 1, this.date.day);
      days = dateToCompareTo.difference(monthAgo).inDays + 1;
    }

    return {'days': days, 'months': months, 'years': years};
  }
}
