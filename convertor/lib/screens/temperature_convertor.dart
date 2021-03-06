import 'package:convertor/models/dropdown_item.dart';
import 'package:convertor/models/temperature.dart';
import 'package:flutter/material.dart';

class TemperatureConvertor extends StatefulWidget {
  TemperatureConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TemperatureConvertorState createState() => _TemperatureConvertorState();
}

class _TemperatureConvertorState extends State<TemperatureConvertor> {
  final MaterialColor mainThemeColor = Colors.teal;

  List<DropdownItem> _temperatureUnit = [
    DropdownItem("Celsius", "celsius"),
    DropdownItem("Kelvin", "kelvin"),
    DropdownItem("Fahrenheit", "fahrenheit")
  ];

  DropdownItem _dropdownValue;
  DropdownItem _dropdownValue2;

  Temperature temperature1 = Temperature(0, 'celsius');
  Temperature temperature2 = Temperature(32, 'fahrenheit');

  @override
  void initState() {
    _dropdownValue = _temperatureUnit.first;
    _dropdownValue2 = _temperatureUnit[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> _dropdownMenuItem = _temperatureUnit.map((e) {
      return DropdownMenuItem<DropdownItem>(
        child: Text(e.text),
        value: e,
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 200,
                          image: AssetImage(
                              'assets/temperature-image.jpg'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton<DropdownItem>(
                            value: _dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: mainThemeColor),
                            underline: Container(
                              height: 2,
                              color: mainThemeColor,
                            ),
                            onChanged: (DropdownItem newValue) {
                              setState(() {
                                _dropdownValue = newValue;

                                temperature1.unit = newValue.value;

                                temperature2.temperature = temperature1
                                    .convertTemperature(temperature2.unit);
                              });
                            },
                            items: _dropdownMenuItem),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 20.0),
                          width: 300,
                          child: TextFormField(
                            key: Key(temperature1.temperature.toString()),
                            initialValue: temperature1.temperature.toString(),
                            keyboardType: TextInputType.number,
                            onChanged: (String value) {
                              setState(() {
                                temperature1.temperature = double.parse(value);
                                temperature2.temperature = temperature1
                                    .convertTemperature(temperature2.unit);
                              });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Value to convert'),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton<DropdownItem>(
                            value: _dropdownValue2,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: mainThemeColor),
                            underline: Container(
                              height: 2,
                              color: mainThemeColor,
                            ),
                            onChanged: (DropdownItem newValue) {
                              setState(() {
                                _dropdownValue2 = newValue;

                                temperature2.unit = newValue.value;

                                temperature1.temperature = temperature2
                                    .convertTemperature(temperature1.unit);
                              });
                            },
                            items: _dropdownMenuItem),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 20.0),
                          width: 300,
                          child: TextFormField(
                            key: Key(temperature2.temperature.toString()),
                            initialValue: temperature2.temperature.toString(),
                            onChanged: (String value) {
                              setState(() {
                                temperature2.temperature = double.parse(value);

                                temperature1.temperature = temperature2
                                    .convertTemperature(temperature1.unit);
                              });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Value to convert'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
