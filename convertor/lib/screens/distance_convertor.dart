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

  List<DropdownItem> _distanceUnit = [
    DropdownItem("Nanomètre - nm", "nm"),
    DropdownItem("Milimètre - mm", "mm"),
    DropdownItem("Centimètre - cm", "cm"),
    DropdownItem("Décimètre - dm", "dm"),
    DropdownItem("Mètre - m", "m"),
    DropdownItem("Kilomètre - km", "km"),
    DropdownItem("Yard - yd", "yd"),
    DropdownItem("Pied - ft", "ft"),
    DropdownItem("Pouce - in", "in"),
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
                  child: Icon(Icons.expand),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButton<DropdownItem>(
                        value: _dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
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
                            border: InputBorder.none,
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
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
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
                            border: InputBorder.none,
                            hintText: 'Value to convert'),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
