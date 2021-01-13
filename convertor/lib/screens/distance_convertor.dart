import 'package:flutter/material.dart';

class DistanceConvertor extends StatefulWidget {
  DistanceConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DistanceConvertorState createState() => _DistanceConvertorState();
}

class _DistanceConvertorState extends State<DistanceConvertor> {
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
