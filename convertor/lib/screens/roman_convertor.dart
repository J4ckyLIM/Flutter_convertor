import 'package:flutter/material.dart';

class RomanConvertor extends StatefulWidget {
  RomanConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RomanConvertorState createState() => _RomanConvertorState();
}

class _RomanConvertorState extends State<RomanConvertor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
