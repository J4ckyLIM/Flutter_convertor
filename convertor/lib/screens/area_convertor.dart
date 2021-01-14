import 'package:convertor/models/area.dart';
import 'package:convertor/models/dropdown_item.dart';
import 'package:flutter/material.dart';

class AreaConvertor extends StatefulWidget {
  AreaConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AreaConvertorState createState() => _AreaConvertorState();
}

class _AreaConvertorState extends State<AreaConvertor> {
  List<DropdownItem> _areaUnit = [
    DropdownItem("Centimètre carré (cm²)", "cm²"),
    DropdownItem("Mètre carré (m²)", "m²"),
    DropdownItem("Kilomètre carrré (km²)", "km²"),
    DropdownItem("Hectare (ha)", "ha"),
    DropdownItem("Acre (ac)", "ac")
  ];

  DropdownItem _dropdownValue;
  DropdownItem _dropdownValue2;

  Area area1 = Area(0, 'm²');
  Area area2 = Area(0, 'km²');

  @override
  void initState() {
    _dropdownValue = _areaUnit[1];
    _dropdownValue2 = _areaUnit[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> _dropDownMenuItem = _areaUnit.map((e) {
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
                    child: Icon(Icons.arrow_downward),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                              area1.unit = newValue.value;

                              area2.area = area1.convertArea(area2.unit);
                            });
                          },
                          items: _dropDownMenuItem),
                      Container(
                        width: 300,
                        child: TextFormField(
                          key: Key(area1.area.toString()),
                          initialValue: area1.area.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            setState(() {
                              area1.area = double.parse(value);
                              area2.area = area1.convertArea(area2.unit);
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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

                              area2.unit = newValue.value;

                              area1.area = area2.convertArea(area1.unit);
                            });
                          },
                          items: _dropDownMenuItem),
                      Container(
                        width: 300,
                        child: TextFormField(
                          key: Key(area2.area.toString()),
                          initialValue: area2.area.toString(),
                          onChanged: (String value) {
                            setState(() {
                              area2.area = double.parse(value);

                              area1.area = area2.convertArea(area1.unit);
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
              ),
            ],
          ),
        ));
  }
}
