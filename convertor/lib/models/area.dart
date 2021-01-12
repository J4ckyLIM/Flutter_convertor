class Area {
  int area;

  String unit;

  Area(this.area, this.unit);

  Map<String, Object> toMeterAreaCoefficients = {
    'cm²': 10000,
    'm²': 1,
    'km²': 1 / 1000000,
    'ha': 1 / 10000,
    'ac': 1 / 4047,
  };

  Map<String, Object> fromMeterAreaToOtherCoefficients = {
    'cm²': 10000,
    'm²': 1,
    'km²': 1 / 1000000,
    'ha': 1 / 10000,
    'ac': 1 / 4047,
  };

  double convertArea(String unitToConvertTo){
    double sizeToMeter = (this.area * toMeterAreaCoefficients[this.unit]).toDouble();
    double sizeToUnit = sizeToMeter * fromMeterAreaToOtherCoefficients[unitToConvertTo];

    return sizeToUnit;
  }
}