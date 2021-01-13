class Birthday {

  DateTime dateBirthday; 

  Birthday(this.dateBirthday); 

  Map<String, Object> liveDuration(DateTime birthday){

    //DateTime dateNow = new DateTime.now();
    
    Duration difference = DateTime.now().difference(birthday);
    
    int hour = difference.inHours;
    int day = difference.inDays;
    String month = (day / 30).toStringAsFixed(2);
    String year = (day / 365).toStringAsFixed(2);
    
    return {
      'hour' : hour,
      'day': day, 
      'month': month, 
      'year': year 
      }; 
  }

  Map<String, Object> nextBirthday() { // fonction pour la date du prochain anniversaire

    DateTime today = new DateTime.now();
    DateTime nextBirthdayDate =
        new DateTime(today.year, this.dateBirthday.month, this.dateBirthday.day);

    if (nextBirthdayDate.isBefore(today)) {
      // nextBirthdayDate.year + 1;
      DateTime newDate =
          new DateTime(today.year + 1, this.dateBirthday.month, this.dateBirthday.day);

      Duration difference = newDate.difference(today);
      int day = difference.inDays;
      String month = (day / 30).toStringAsFixed(0);

      return {'day': day +1, 'month': month};
    } else {
      Duration difference = nextBirthdayDate.difference(today);
      int day = difference.inDays;
      String month = (day / 30).toStringAsFixed(0);

      return {'day': day +1, 'month': month};
    }
  }

}

