class Distance {

  double distance;

  String unit;

  Distance(this.distance, this.unit);


  Map<String, Object> toMeterCoefficients = {
    'nm': 1,
    'mm': 1000000,
    'cm': 10000000,
    'dm': 100000000,
    'm': 1000000000,
    'km': 1000000000000,
    'yd': 914400000,
    'ft': 304700000,
    'in': 25400000,
  };

  Map<String, Object> fromMeterToOtherCoefficients = {
    'nm': 1,
    'mm': 1 / 1000000,
    'cm': 1 / 10000000,
    'dm': 1 / 100000000,
    'm': 1 / 1000000000,
    'km': 1 / 1000000000000,
    'yd': 1 / 914400000,
    'ft': 1 / 304700000,
    'in': 1 / 25400000,
  };

  double convertDistance(String unitToConvert){
    double distanceToMeter = (this.distance * toMeterCoefficients[this.unit]).toDouble();
    double distanceToUnitToConvert = distanceToMeter * fromMeterToOtherCoefficients[unitToConvert];

    return distanceToUnitToConvert;
  }
}