class Roman {
  int value;

  String romanValue;

  Roman(this.value, this.romanValue);

  Map<int, String> romanNumber = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I'
  };

  Map<String, int> romanNumber2 = {
    'M' : 1000,
    'CM' : 900,
    'D' : 500,
    'CD' : 400,
    'C' : 100,
    'XC' : 90,
    'L' : 50,
    'XL' : 40,
    'X' : 10,
    'IX' : 9,
    'V' : 5,
    'IV' : 4,
    'I' : 1
  };

  String convertToRoman() {
    this.romanValue = "";
    romanNumber.forEach((decimal, romanLetter) {
      while (this.value >= decimal) {
        this.romanValue += romanLetter;
        this.value -= decimal;
      }
    });
    return this.romanValue;
  }

  int convertRomanToInt(String roman){
    int len = roman.length;
    int result = 0;

    for(var i = 0; i < len; i++){
      print("i : $i");
      if( (i + 1) < len && romanNumber2[roman[i]] < romanNumber2[roman[i + 1]]){
        print('if 1');
        result -= romanNumber2[roman[i]];
        print(romanNumber2[roman[i]]);
      } else {
        print('else');
        result += romanNumber2[roman[i]];
        print(romanNumber2[roman[i]]);
      }
    }
    return result;
  }
}
