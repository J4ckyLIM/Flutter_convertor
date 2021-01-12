class FileSize {
  int size;

  String unit;

  Map<String, Object> toOctetCoefficients = {
    'o': 1,
    'ko': 1 / 1000,
    'mo': 1 / 1000000,
    'go': 1 / 1000000000,
    'to': 1 / 1000000000000,
    'po': 1 / 1000000000000000
  };

  Map<String, Object> fromOctetToOtherCoefficients = {
    'o': 1,
    'ko': 1000,
    'mo': 1000000,
    'go': 1000000000,
    'to': 1000000000000,
    'po': 1000000000000000
  };

  FileSize(int mySize, String myUnit) {
    this.size = mySize;
    this.unit = myUnit;
  }

  double convertSize(String unitToConvertTo) {
    double sizeToOctet = this.size * toOctetCoefficients[this.unit];
    double sizeToUnit =
        sizeToOctet * fromOctetToOtherCoefficients[unitToConvertTo];
    return sizeToUnit;
  }
}
