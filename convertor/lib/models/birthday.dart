class Birthday {

  DateTime dateBirthday; 

  Birthday(this.dateBirthday); 

  Map<String, Object> lifeDuration(DateTime birthday){

    
    Duration difference = DateTime.now().difference(birthday);
    
    int hoursLived = difference.inHours;
    int daysLived = difference.inDays;
    String monthsLived = (daysLived / 30).toStringAsFixed(2);
    String yearsLived = (daysLived / 365).toStringAsFixed(2);
    
    return {'hour' : hoursLived, 'day': daysLived, 'month': monthsLived, 'year': yearsLived }; 
  }

  Map<String, Object> nextBirthday() { // fonction pour la date du prochain anniversaire

    DateTime today = new DateTime.now();
    DateTime nextBirthdayDate =
        new DateTime(today.year, this.dateBirthday.month, this.dateBirthday.day);

    if (nextBirthdayDate.isBefore(today)) {
      
      DateTime secondNextBirthdayDate =
          new DateTime(today.year + 1, this.dateBirthday.month, this.dateBirthday.day); 

      Duration difference = secondNextBirthdayDate.difference(today);
      int differenceInDays = difference.inDays;
      String differenceInMonths = (differenceInDays / 30).toStringAsFixed(0);

      return {'day': differenceInDays + 1, 'month': differenceInMonths};
    } else {
      Duration difference = nextBirthdayDate.difference(today);
      int differenceInDays = difference.inDays;
      String differenceInMonths = (differenceInDays / 30).toStringAsFixed(0);

      return {'day': differenceInDays + 1, 'month': differenceInMonths};
    }
  }

}

