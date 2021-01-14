import 'package:convertor/models/roman.dart';
import 'package:flutter/material.dart';

class RomanConvertor extends StatefulWidget {
  RomanConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RomanConvertorState createState() => _RomanConvertorState();
}

class _RomanConvertorState extends State<RomanConvertor> {

  //Roman _roman2 = Roman(5, "V");

  Roman _roman1 = Roman(1 , "I");

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      width: 300,
                      child:
                      TextFormField(
                        key: Key(_roman1.value.toString()),
                        initialValue: _roman1.value.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          setState(() {
                            _roman1.value = int.parse(value);

                            _roman1.romanValue = _roman1.convertToRoman().toString();
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
                    Container(
                      width: 300,
                      child:
                      TextFormField(
                        key: Key(_roman1.romanValue),
                        initialValue: _roman1.romanValue,
                        onChanged: (String value) {
                          setState(() {
                            _roman1.romanValue = value;

                            _roman1.value = _roman1.convertRomanToInt(_roman1.romanValue);
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
