class Roman {
  int value;

  Roman(this.value);

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

  String convertToRoman() {
    String romanValue = '';
    romanNumber.forEach((decimal, romanLetter) {
      while (this.value >= decimal) {
        romanValue += romanLetter;
        this.value -= decimal;
      }
    });
    return romanValue;
  }
}
