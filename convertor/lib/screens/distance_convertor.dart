import 'package:convertor/models/distance.dart';
import 'package:convertor/models/dropdown_item.dart';
import 'package:flutter/material.dart';

class DistanceConvertor extends StatefulWidget {
  DistanceConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DistanceConvertorState createState() => _DistanceConvertorState();
}

class _DistanceConvertorState extends State<DistanceConvertor> {
  final MaterialColor mainThemeColor = Colors.teal;


  List<DropdownItem> _distanceUnit = [
    DropdownItem("Nanometer - nm", "nm"),
    DropdownItem("Millimeter - mm", "mm"),
    DropdownItem("Centimeter - cm", "cm"),
    DropdownItem("Decimeter - dm", "dm"),
    DropdownItem("Meter - m", "m"),
    DropdownItem("Kilometer - km", "km"),
    DropdownItem("Yard - yd", "yd"),
    DropdownItem("Feet - ft", "ft"),
    DropdownItem("Inch - in", "in"),
  ];

  DropdownItem _dropdownValue;
  DropdownItem _dropdownValue2;

  Distance _distance1 = Distance(0, "m");
  Distance _distance2 = Distance(0, "km");

  @override
  void initState() {
    super.initState();
    _dropdownValue = _distanceUnit[4];
    _dropdownValue2 = _distanceUnit[5];
  }


  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem> _dropdownMenuItem = _distanceUnit.map((e) {
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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image(
                      height: 200,
                      image: AssetImage(
                          'assets/distance-image.png'
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

                              _distance1.unit = newValue.value;

                              _distance2.distance =
                                  _distance1.convertDistance(_distance2.unit);
                            });
                          },
                          items: _dropdownMenuItem),
                      Container(
                        margin: new EdgeInsets.symmetric(horizontal: 20.0),
                        width: 300,
                        child:
                        TextFormField(
                          key: Key(_distance1.distance.toString()),
                          initialValue: _distance1.distance.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            setState(() {
                              _distance1.distance = double.parse(value);

                              _distance2.distance =
                                  _distance1.convertDistance(_distance2.unit);
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

                              _distance2.unit = newValue.value;

                              _distance1.distance =
                                  _distance2.convertDistance(_distance1.unit);
                            });
                          },
                          items: _dropdownMenuItem),
                      Container(
                        margin: new EdgeInsets.symmetric(horizontal: 20.0),
                        width: 300,
                        child:
                        TextFormField(
                          key: Key(_distance2.distance.toString()),
                          initialValue: _distance2.distance.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            setState(() {
                              _distance2.distance = double.parse(value);

                              _distance1.distance =
                                  _distance2.convertDistance(_distance1.unit);
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
            )
          ],
        ),
      ),
    );
  }
}
