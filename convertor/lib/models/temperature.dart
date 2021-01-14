class Temperature {
  double temperature;

  String unit;

  double kelvinConst = 273.15;

  double fahrenheitConst = 32;

  Temperature(this.temperature, this.unit);

  double convertTemperature(String unitToConvertTo) {
    Map<String, Map<String, Object>> listTemperature = {
      'celsius': {
        'celsius': this.temperature,
        'kelvin': this.temperature + this.kelvinConst,
        'fahrenheit': (this.temperature * (9 / 5)) + this.fahrenheitConst,
      },
      'kelvin': {
        'kelvin': this.temperature,
        'celsius': this.temperature - this.kelvinConst,
        'fahrenheit': (this.temperature - this.kelvinConst) * (9 / 5) +
            this.fahrenheitConst,
      },
      'fahrenheit': {
        'fahrenheit': this.temperature,
        'celsius': (this.temperature - this.fahrenheitConst) * (5 / 9),
        'kelvin': (this.temperature - this.fahrenheitConst) * (5 / 9) +
            this.kelvinConst,
      }
    };

    return listTemperature[this.unit][unitToConvertTo];
  }
}
