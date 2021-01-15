import 'package:convertor/models/roman.dart';
import 'package:flutter/material.dart';

class RomanConvertor extends StatefulWidget {
  RomanConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RomanConvertorState createState() => _RomanConvertorState();
}

class _RomanConvertorState extends State<RomanConvertor> {
  final MaterialColor mainThemeColor = Colors.teal;

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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image(
                      height: 250,
                      image: AssetImage(
                          'assets/roman-image.jpg'
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
                      Container(
                        margin: new EdgeInsets.symmetric(horizontal: 20.0),
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
                              border: OutlineInputBorder(),
                              labelText: 'Decimal',
                              hintText: 'Value to convert'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: new EdgeInsets.symmetric(horizontal: 20.0),
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
                              border: OutlineInputBorder(),
                              labelText: 'Roman numeral',
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
