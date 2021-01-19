class BinaryConvertor {
  int value;

  String unit;

  BinaryConvertor(this.value, this.unit);

  dynamic convertToUnit(String unitToConvertTo) {
    Map<String, Map<String, Object>> binaryConvertor = {
      'BIN': {'BIN': 1, 'OCT': 0, 'DEC': 1, 'HEX': 0},
      'OCT': {'BIN': 1, 'OCT': 0, 'DEC': 1, 'HEX': 0},
      'DEC': {
        'BIN': this.value.toRadixString(2),
        'OCT': this.value.toRadixString(8),
        'DEC': this.value.toRadixString(10),
        'HEX': this.value.toRadixString(16)
      },
      'HEX': {'BIN': 1, 'OCT': 0, 'DEC': 1, 'HEX': 0}
    };

    return binaryConvertor[this.unit][unitToConvertTo];
  }
}
