class Birthday {
  DateTime dateBirthday;

  Birthday(this.dateBirthday);

  Map<String, int> lifeDuration() {
    Duration difference = DateTime.now().difference(this.dateBirthday);

    int hoursLived = difference.inHours;
    int daysLived = difference.inDays;
    int monthsLived = daysLived ~/ 30;
    int yearsLived = daysLived ~/ 365;

    return {
      'hour': hoursLived,
      'day': daysLived,
      'month': monthsLived,
      'year': yearsLived
    };
  }

  Map<String, int> allTimeLiving() {
    DateTime now = DateTime.now();
    int years = now.year - this.dateBirthday.year;
    int months = now.month - this.dateBirthday.month;
    int days = now.day - this.dateBirthday.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }
    if (days < 0) {
      DateTime monthAgo =
          DateTime(now.year, now.month - 1, this.dateBirthday.day);
      days = now.difference(monthAgo).inDays + 1;
    }
    return {'years': years, 'months': months, 'days': days};
  }

  Map<String, int> nextBirthday() {
    DateTime today = new DateTime.now();
    DateTime nextBirthdayDate = new DateTime(
        today.year, this.dateBirthday.month, this.dateBirthday.day);

    if (nextBirthdayDate.isBefore(today)) {
      DateTime secondNextBirthdayDate = new DateTime(
          today.year + 1, this.dateBirthday.month, this.dateBirthday.day);

      Duration difference = secondNextBirthdayDate.difference(today);
      int differenceInDays = difference.inDays;
      int differenceInMonths =
          int.parse((differenceInDays / 30).toStringAsFixed(0));

      return {'months': differenceInMonths, 'days': differenceInDays + 1};
    } else {
      Duration difference = nextBirthdayDate.difference(today);
      int differenceInDays = difference.inDays;
      int differenceInMonths =
          int.parse((differenceInDays / 30).toStringAsFixed(0));
      return {'months': differenceInMonths, 'days': differenceInDays + 1};
    }
  }
}

class NextBirthday {
  int inMonths;
  int inDays;

  NextBirthday(this.inMonths, this.inDays);
}

class AllTimeLivingInfo {
  int years;
  int months;
  int days;

  AllTimeLivingInfo(this.years, this.months, this.days);
}
