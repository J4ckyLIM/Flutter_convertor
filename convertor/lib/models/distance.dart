class Distance {

  int distance;

  String unit;

  Distance(this.distance, this.unit);

  Map<String, Object> toMeterCoefficients = {
    'nm': 1 / 1000000000,
    'mm': 1 / 1000,
    'cm': 1 / 100,
    'dm': 1 / 10,
    'm': 1 ,
    'km': 1000,
    'yd': 1 / 1.094,
    'ft': 1 / 3.281,
    'in': 1 / 39.3701
  };

  Map<String, Object> fromMeterToOtherCoefficients = {
    'nm': 1000000000,
    'mm': 1000,
    'cm': 100,
    'dm': 10,
    'm': 1,
    'km': 1000,
    'yd': 1.094,
    'ft': 3.281,
    'in': 39.3701
  };

  double convertDistance(String unitToConvert){
    double distanceToMeter = (this.distance * toMeterCoefficients[this.unit]).toDouble();
    double distanceToUnitToConvert = distanceToMeter * fromMeterToOtherCoefficients[unitToConvert];

    return distanceToUnitToConvert;
  }


}