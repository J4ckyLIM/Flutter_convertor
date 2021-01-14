class Area {
  double area;

  String unit;

  Area(this.area, this.unit);

  Map<String, Object> toMeterAreaCoefficients = {
    'cm²': 1,
    'm²': 10000,
    'km²': 10000000000,
    'ha': 100000000,
    'ac': 40470000,
  };

  Map<String, Object> fromMeterAreaToOtherCoefficients = {
    'cm²': 1,
    'm²': 1 / 10000,
    'km²': 1 / 10000000000,
    'ha': 1 / 100000000,
    'ac': 1 / 40470000,
  };

  double convertArea(String unitToConvertTo) {
    double sizeToMeter =
        (this.area * toMeterAreaCoefficients[this.unit]).toDouble();
    double sizeToUnit =
        sizeToMeter * fromMeterAreaToOtherCoefficients[unitToConvertTo];

    return sizeToUnit;
  }
}
